#!/bin/bash

function frmn_main () {
  [[ -z "$WORKERNAME" ]] && {
    echo "WORKERNAME not set"
    return 1
  } 
  [[ -z "$FOREMAN_CLIENT_ID" ]] && {
    echo "FOREMAN_CLIENT_ID not set"
    return 1
  } 
  [[ -z "$FOREMAN_API_KEY" ]] && {
    echo "FOREMAN_API_KEY not set"
    return 1
  } 
  return 0
}

function frmn_create_pickaxe() {
    local latest_version=$(frmn_get_latest_pickaxe_version)

    # Create a new pickaxe instance in Foreman for this rig
    local pickaxe_json=$(jq -n --arg client $FOREMAN_CLIENT_ID \
                            --arg plabel "$WORKERNAME" \
                            --arg version "$latest_version" '. | 
                                {
                                    client: $client|tonumber,
                                    label: $plabel,
                                    version: $version
                                }')
    echo $(curl \
            -s \
            -X POST \
            -H "Content-Type: application/json" \
            -H "Authorization: Token $FOREMAN_API_KEY" \
            -d "$pickaxe_json" \
            https://dev-dan.foreman.mn/api/pickaxe/$FOREMAN_CLIENT_ID | \
            jq -r '.key')
}

function frmn_get_current_pickaxe_version() {
    if [ -d $NVOC/foreman/pickaxe ]; then
        echo $(unzip \
                -q \
                -c $NVOC/foreman/pickaxe/lib/foreman-pickaxe-*.jar META-INF/MANIFEST.MF | \
                grep "Implementation-Version" | cut -d ':' -f2 | tr -d '\r' | xargs)
    else
        echo ""
    fi
}

function frmn_get_latest_pickaxe_version() {
    echo $(wget \
            -qO- \
            https://api.github.com/repos/delawr0190/foreman-apps/releases | \
            jq -r '[.[] | .tag_name][0]')
}

function frmn_get_pickaxe_id() {
    echo $(grep -s "pickaxeId" $NVOC/foreman/pickaxe/conf/pickaxe.yml | cut -d ':' -f 2 | xargs)
}

frmn_main