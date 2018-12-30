PARENT_DIR=`pwd`

cd packages/pkg_a
source .venv/bin/activate
python3 setup.py develop --verbose

cd $PARENT_DIR

cd packages/pkg_b
source .venv/bin/activate
python3 setup.py develop --verbose

cd $PARENT_DIR
