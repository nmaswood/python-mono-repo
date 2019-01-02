PARENT_DIR=`pwd`

cd packages/pkg_a
source .venv/bin/activate
pip install -e .

cd $PARENT_DIR

cd packages/pkg_b
source .venv/bin/activate
pip install -e .

cd $PARENT_DIR
