function psqlResetDb() {
    rm -rf /usr/local/var/postgres && initdb /usr/local/var/postgres -E utf8
}
