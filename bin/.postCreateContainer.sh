#! /bin/sh
echo 'update .bashrc'
cat >>${HOME}/.bashrc <<'EOF'

am() {
    cd ${CONTESTS_DIR:-/root/problems}
    command am "$@"
}
EOF

echo 'login for acc'
acc login
echo 'login for oj'
oj login http://atcoder.jp
