alias tfi="terraform init"
alias tfmt="terraform fmt"
alias tfp="terraform plan"
alias tfa="terraform apply"
alias tfr="terraform refresh"
alias tfv="terraform validate"

alias tgi="terragrunt init"
alias tgiu="terragrunt init -upgrade"
alias tgir="terragrunt init -reconfigure"
alias tgfmt="terragrunt fmt"
alias tgp="terragrunt plan"
alias tga="terragrunt apply"
alias tgr="terragrunt refresh"
alias tgpl="terragrunt providers lock -platform=darwin_amd64 -platform=linux_amd64"
alias tgsl="terragrunt state list"


function tfoj() {
    terraform output -json $*
}
