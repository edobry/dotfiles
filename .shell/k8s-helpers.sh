
# add krew to PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

function secretEncode() {
   echo -n "$1" | base64 | pbcopy
}

alias netshoot='kubectl run --generator=run-pod/v1 tmp-shell --rm -i --tty --image nicolaka/netshoot -- /bin/bash'

function downDeploy() {
    kubectl scale deployment $1 --replicas=0
}

function upDeploy() {
    kubectl scale deployment $1 --replicas=1
}

DEV_DIR=~/Projects/dataeng-pipeline/dev
DEBUG_POD="test-shell"
function debugPod() {
    k apply -f $DEV_DIR/debugPod.yaml
    k wait --for=condition=Ready pod/$DEBUG_POD
    k exec $DEBUG_POD --container $DEBUG_POD -i --tty -- /bin/bash
    k delete pods $DEBUG_POD --grace-period=0 --force
}
