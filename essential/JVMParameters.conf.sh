# This file is interpreted by bash's `source` builtin when
# launching the Miencraft server. Configure the parameters
# used to start the JVM instance below:

#################
# MEMORY TUNING #
#################

# Amount of memory allocated for the JVM Heap (roughly
# speaking, the working space for runtime data).
JVM_HEAP=1856M

# Amount of memory allocated for the garbage collector's
# "Permanent" generation -- in JVM 7 and below, any
# classes, functions, and interned strings generated at
# runtime are stored in a "Permanent" GC generation,
# which is never collected. I'm not sure why we use 256M
# here, but that's what it was set to before. We should
# keep an eye on perm-gen usage via JMX and see if we
# can get away with lowering this, or if the modpack
# requires this much memory for hotpatched code. We
# set this as a max, and allow dynamic growth up to it.
GC_PERM_GEN=256M

# Amount of memory allocated for the GC's Young
# generation -- rapidly created and destroyed objects
# populate this space, with those surviving a few
# sweeps being promoted to the old generation.
GC_YOUNG_GEN=256M

# Number of threads to use for parallel GC sweeps
GC_PARALLEL_THREADS=2


#####################
# JMX CONFIGURATION #
#####################

JMX_PORT=40104


#########################
# ARGUMENT CONSTRUCTION #
#########################

MEM_ARGS="-Xmx${JVM_HEAP} -Xms${JVM_HEAP} -Xmn${GC_YOUNG_GEN} -XX:MaxPermSize=${GC_PERM_GEN}"

GC_ARGS="-XX:+UseConcMarkSweepGC -XX:+CMSIncrementalPacing -XX:ParallelGCThreads=${GC_PARALLEL_THREADS}"

OPT_ARGS="-XX:+AggressiveOpts -XX:+UseCompressedOops -d64 -XX:-UseStringCache"

JMX_ARGS="-Dcom.sun.management.jmxremote.port=${JMX_PORT} -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"

#######################
# FINAL OPTION STRING #
#######################
CONFIG_OPTS="${MEM_ARGS} ${GC_ARGS} ${OPT_ARGS} ${JMX_ARGS}"
