[vpc]
1 vpc - kubernetes  - ${var.vpc_name}
1 dhcp options set
1 link dhcp options set to vpc

1 subnet - jumpnet   - ${var.vpc_name}-jumpnet   (Public)
1 subnet - kubernetes - ${var.vpc_name}-kubernetes (Private)

1 Internet Gateway  - ${var.vpc_name}

1 Nat Gateway

1 Elastic IP - true for vpc

1 Nat Gateway

1 route table  public  - ${var.vpc_name}-jumpnet   - IG attached
1 route table public association with public subnet

1 route table private - ${var.vpc_name}-kubernetes   - Nat gateway attached
1 route table private association with privvate subnet

1 Secuity Group ${var.vpc_name}-jumpnet
1 security group rule for egress to world
1 security group rule for igress to 22 - all all from control host (localippublic)
1 sg rule for igress to 0 - allow from public subnet to jumpnet
1 sg rule for igress to 0 - allow from private subnet to jumpnet

1 Secuity Group ${var.vpc_name}-kubernetes
1 security group rule for egress to world    egress
1 sg rule to allow everyone from public subnet igress
1 sg rule to allow everyone from private subnet igress
1 sg rule to allow everyone from elb



[iam]
1 iam role - kubernetes-controller - ${var.vpc_name}-controller
1 iam role - kubernetes-worker - ${var.vpc_name}-worker
1 iam role - kubernetes-etcd
 


1 iam role policy - kubernetes-controller - ${var.vpc_name}-controller
1 iam role policy - kubernetes-worker - ${var.vpc_name}-worker
1 iam role policy - kubernetes-etcd - ${var.vpc_name}-etcd

1 iam instance profile - kubernetes-controller - ${var.vpc_name}-controller
1 iam instance profile - kubernetes-worker - ${var.vpc_name}-worker
1 iam instance profile - kubernetes-etcd - kubernetes-etcd




[ec2]

[controller]
ec2 instance conteoller   count-3 , subnet - kubernetes , private ip  sg id - kubernetes
aws elb - kubernetes_api
1 sg - kubernetes_api  - ${var.elb_name}
1 sg rule association to egress all from world 
1 sg rule association to igress from control host[publicip] - 6443
1 sg rule association ro igress from jump host [jump.public_ip]-6443
output kubernetes_api_dns_name" {
  value = "${aws_elb.kubernetes_api.dns_name}"
} 



[worker]
ec2 instance worker count-3 subnet - kubernetes, private ip  sg id - kubernetes
output "kubernetes_workers_public_ip" {
  value = "${join(",", aws_instance.worker.*.public_ip)}"
}	


[etcd]
ec2 instance etcd count-3 subnet - kubernetes private ip sg id - kubernetes


[jumphost]
ec2 instance - 1 jump ${var.vpc_name}-jumphost-0

output "jumphost_dns_name" {
  value = "${aws_instance.jump.public_dns}"
}

output "jumphost_ip_address" {
  value = "${aws_instance.jump.public_ip}"
}







