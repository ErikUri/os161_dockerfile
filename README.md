# os161_dockerfile
a dockerfile for building os161 from my fork: https://github.com/ErikUri/os161


## Usage:
    docker build -t eksu/os161 .
    docker run -ti --name os161 eksu/os161
    
then, in your container:

    cd ~/os161/root/
    sys161 kernel
    
^_^
