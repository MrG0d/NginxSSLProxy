cp -n .env.dist .env
cp -n ops/default.conf.dist default.conf

echo "Enter SERVER_NAME: "
read servername


echo "Enter EMAIL: "
read email

HOST_DOCKER=$(ip addr show | grep 'global docker' | cut -d: -f1 | awk '{print $2}' | cut -d/ -f1)
echo "Enter docker ip [$HOST_DOCKER]: "
read host


if [ -z "$host" ]; then
  host=$HOST_DOCKER
fi

sed -i "s/__SERVER_NAME__/${servername}/" default.conf
sed -i "s/__HOST__/${host}/" default.conf
sed -i "s/SERVER_NAME=.*/SERVER_NAME=${servername}/" .env
sed -i "s/EMAIL=.*/EMAIL=${email}/" .env
sed -i "s/HOST_IP=.*/HOST_IP=${host}/" .env