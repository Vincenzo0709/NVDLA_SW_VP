# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This is the custom container Dockerfile for NVDLA VP:
#       1. Take the container base image from nvdla/vp;
#       2. Copy "startup.sh" script into container environment;
#       3. Make sure that "startup.sh" script is executed at every container startup.

# Container base image
FROM nvdla/vp

# Copy startup.sh to container environment
COPY startup.sh /startup.sh

# CMD section - executed at each container run
CMD ["/startup.sh"]
