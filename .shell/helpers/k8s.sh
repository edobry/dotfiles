
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

function reDeploy() {
    downDeploy $1
    upDeploy $1
}

DEV_DIR=~/Projects/dataeng-pipeline/dev
DEBUG_POD="test-shell"
function debugPod() {
    k apply -f $DEV_DIR/debugPod.yaml
    k wait --for=condition=Ready pod/$DEBUG_POD
    k exec $DEBUG_POD --container $DEBUG_POD -i --tty -- /bin/bash
    k delete pods $DEBUG_POD --grace-period=0 --force
}

function getToken() {
    local eksAdminSecret="$(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')"
    kubectl -n kube-system describe secret $eksAdminSecret | grep 'token:' | awk '{print $2}' | pbcopy
}

TF_DIR="$HOME/Projects/terraform"
TF_DATAENG_DIR="$TF_DIR/env/dataeng-dev"
function runTF() {
    cd $TF_DATAENG_DIR/$1 && shift
    terraform $*
    cd $OLDPWD
}

function getMSKBrokers() {
    local mskBrokers=$(runTF bnb-kafka output msk_bootstrap_brokers)
    echo $mskBrokers
}

alias escapeCommas="sed 's/,/\\\,/g'"

HELM_HOME="$HOME/Projects/dataeng-pipeline/charts"
EXTERNAL_DIR="$HELM_HOME/external-resources"
function makeService() {
    local name=$1
    shift
    helm template $name $EXTERNAL_DIR/service --set name=$name $*
}

