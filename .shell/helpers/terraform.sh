alias tfi="terraform init"
alias tfmt="terraform fmt"
alias tfp="terraform plan"
alias tfa="terraform apply"
alias tfr="terraform refresh"
alias tfv="terraform validate"

function tfoj() {
    terraform output -json $*
}
