cp -n .env.dist .env
cp -n ops/default.conf.dist default.conf

echo "Enter SERVER_NAME: "
read servername


echo "Enter EMAIL: "
read email

HOST_IP=$(ip addr show | grep 'global docker' | cut -d: -f1 | awk '{print $2}' | cut -d/ -f1)
echo "$HOST_IP"
echo "Enter docker ip [$HOST_IP]: "
read host


if [ -n "$host" ]; then
  host=$HOST_IP
fi


sed -i "s/SERVER_NAME=.*/SERVER_NAME=${servername}/" .env
sed -i "s/EMAIL=.*/EMAIL=${email}/" .env
sed -i "s/HOST_IP=.*/HOST_IP=${host}/" .env