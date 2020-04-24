export SSM_SEEDER_PASSWORD_PARAM="/dataeng/seeder/RDS_PASSWORD"

function getSecureParam() {
   aws ssm get-parameter --name $1 --with-decryption | jq ".Parameter.Value" | sed "s/\"//g"
}
