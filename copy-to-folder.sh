if [[ $# -ne 1 ]]
then
    echo "USAGE: $0 <path to folder>"
    exit 1
fi

if [[ ! -d $1 ]]
then
    echo "The argument must be a directory"
    echo "USAGE: $0 <path to folder>"
    exit 1
fi

if [[ -z qtest.q || -z assertq.q || -z termcolour.q ]]
then
    echo "Can't find at least one of qtest.q, assertq.q and termcolour.q in `pwd`"
    exit 1
fi

mkdir qtest
cp assertq.q qtest
cp qtest.q qtest
cp termcolour.q qtest
mv qtest $1
