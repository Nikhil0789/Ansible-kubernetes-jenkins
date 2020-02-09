# Ansible EC2 external inventory script settings
#

[ec2]
# Retrieve only instances with (key=value) env=staging tag
instance_filters = tag:ansibleFilter=${ansibleFilter}

# AWS regions to make calls to. Set this to 'all' to make request to all regions
# in AWS and merge the results together. Alternatively, set this to a comma
# separated list of regions. E.g. 'us-east-1,us-west-1,us-west-2'
# regions = all
regions_exclude =
regions = ${regions}

# When generating inventory, Ansible needs to know how to address a server.
# Each EC2 instance has a lot of variables associated with it. Here is the list:
#   http://docs.pythonboto.org/en/latest/ref/ec2.html#module-boto.ec2.instance
# Below are 2 variables that are used as the address of a server:
#   - destination_variable
#   - vpc_destination_variable

# This is the normal destination variable to use. If you are running Ansible
# from outside EC2, then 'public_dns_name' makes the most sense. If you are
# running Ansible from within EC2, then perhaps you want to use the internal
# address, and should set this to 'private_dns_name'. The key of an EC2 tag
# may optionally be used; however the boto instance variables hold precedence
# in the event of a collision.
#destination_varie = public_dns_name
#destination_variable = ip_address
destination_variable = private_ip_address

# This allows you to override the inventory_name with an ec2 variable, instead
# of using the destination_variable above. Addressing (aka ansible_ssh_host)
# will still use destination_variable. Tags should be written as 'tag_TAGNAME'.
#hostname_variable = tag_Name
hostname_variable = tag_ansibleNodeName

# For server inside a VPC, using DNS names may not make sense. When an instance
# has 'subnet_id' set, this variable is used. If the subnet is public, setting
# this to 'ip_address' will return the public IP address. For instances in a
# private subnet, this should be set to 'private_ip_address', and Ansible must
# be run from within EC2. The key of an EC2 tag may optionally be used; however
# the boto instance variables hold precedence in the event of a collision.
# WARNING: - instances that are in the private vpc, _without_ public ip address
# will not be listed in the inventory until You set:
#vpc_destination_variable = private_ip_address
vpc_destination_variable = private_ip_address

# To tag instances on EC2 with the resource records that point to them from
# Route53, uncomment and set 'route53' to True.
route53 = False

# To exclude RDS instances from the inventory, uncomment and set to False.
rds = False

# To exclude ElastiCache instances from the inventory, uncomment and set to False.
elasticache = False

# By default, only EC2 instances in the 'running' state are returned. Set
# 'all_instances' to True to return all instances regardless of state.
all_instances = False

# By default, only RDS instances in the 'available' state are returned.  Set
# 'all_rds_instances' to True return all RDS instances regardless of state.
all_rds_instances = False

# By default, only ElastiCache clusters and nodes in the 'available' state
# are returned. Set 'all_elasticache_clusters' and/or 'all_elastic_nodes'
# to True return all ElastiCache clusters and nodes, regardless of state.
#
# Note that all_elasticache_nodes only applies to listed clusters. That means
# if you set all_elastic_clusters to false, no node will be return from
# unavailable clusters, regardless of the state and to what you set for
# all_elasticache_nodes.
all_elasticache_replication_groups = False
all_elasticache_clusters = False
all_elasticache_nodes = False

# API calls to EC2 are slow. For this reason, we cache the results of an API
# call. Set this to the path you want cache files to be written to. Two files
# will be written to this directory:
#   - ansible-ec2.cache
#   - ansible-ec2.index
cache_path = ~/.ansible/tmp

# The number of seconds a cache file is considered valid. After this many
# seconds, a new API call will be made, and the cache file will be updated.
# To disable the cache, set this value to 0
cache_max_age = 300

# Organize groups into a nested/hierarchy instead of a flat namespace.
nested_groups = False

# Replace - tags when creating groups to avoid issues with ansible
replace_dash_in_groups = True

# If set to true, any tag of the form "a,b,c" is expanded into a list
# and the results are used to create additional tag_* inventory groups.
expand_csv_tags = False

# The EC2 inventory output can become very large. To manage its size,
# configure which groups should be created.
group_by_instance_id = True
group_by_region = True
group_by_availability_zone = True
group_by_ami_id = True
group_by_instance_type = True
group_by_key_pair = True
group_by_vpc_id = True
group_by_security_group = True
group_by_tag_keys = True
group_by_tag_none = True
group_by_route53_names = True
group_by_rds_engine = True
group_by_rds_parameter_group = True
group_by_elasticache_engine = True
group_by_elasticache_cluster = True
group_by_elasticache_parameter_group = True
group_by_elasticache_replication_group = True


[credentials]

# The AWS credentials can optionally be specified here. Credentials specified
# here are ignored if the environment variable AWS_ACCESS_KEY_ID or
# AWS_PROFILE is set, or if the boto_profile property above is set.
#
# Supplying AWS credentials here is not recommended, as it introduces
# non-trivial security concerns. When going down this route, please make sure
# to set access permissions for this file correctly, e.g. handle it the same
# way as you would a private SSH key.
#
# Unlike the boto and AWS configure files, this section does not support
# profiles.
#
# aws_access_key_id = AXXXXXXXXXXXXXX
# aws_secret_access_key = XXXXXXXXXXXXXXXXXXX
# aws_security_token = XXXXXXXXXXXXXXXXXXXXXXXXXXXX