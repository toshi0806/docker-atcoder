#! /bin/sh
echo 'update .bashrc'
cat >>${HOME}/.bashrc <<'EOF'

am() {
    cd ${CONTEST_DIR:-${HOME}/contest}
    command am "$@"
}
EOF

echo 'create symlinks for makefile'
cd ${HOME}/.config/atcoder-cli-nodejs
progs=$(find . ! -name . -type d -print | sed -e 's,\./,,')
for i in ${progs}; do
  (cd ${i}; ln -sf ${HOME}/lib/.support/makefile)
done

echo 'login for acc'
acc login
echo 'login for oj'
oj login http://atcoder.jp
