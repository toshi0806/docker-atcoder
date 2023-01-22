#! /bin/sh
echo 'update .bashrc'
cat >>${HOME}/.bashrc <<'EOF'

am() {
    cd ${CONTEST_DIR:-${HOME}/contest}
    command am "$@"
}
EOF

echo 'login for acc'
acc login
echo 'login for oj'
oj login http://atcoder.jp
