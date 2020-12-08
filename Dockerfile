ARG CUDA_VERSION=11.0
ARG LINUX_VERSION=ubuntu18.04
FROM rapidsai/rapidsai:cuda${CUDA_VERSION}-runtime-${LINUX_VERSION}

WORKDIR /rapids/
RUN mkdir dimreduc_client
WORKDIR /rapids/dimreduc_client/
COPY . .

RUN source activate rapids && conda install -c conda-forge --file environment_for_docker.yml && pip install dash-dangerously-set-inner-html

ENTRYPOINT ["bash","./entrypoint.sh"]