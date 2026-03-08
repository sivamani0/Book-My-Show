#vpc variable values
vpc_cidr_block = "10.0.0.0/16"
instance_tenancy = "default"
vpc_name = "sivamani-vpc"

#public subnet variable values
pub_sub_cidr_block =  "10.0.1.0/24"
pub_sub_az =  "ap-northeast-3a"
pub_sub_name = "sivamani-pub-sub"


#internet gateway variable values
internet_gt_name = "sivamani-igw"

#public route variable values
pub_route_cidr_block = "0.0.0.0/0"
pub_route_name = "sivamani-pub-RT"

#key pair variable values
key_name = "sivamani-key"
public_key =  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDdeMGH5l7UAOIFeF0laeGojL9Lapu7+/Y2pa+5+97Y01Bco+IqZvOdJDTue5QmbUtrAF6VRKB0fTlCRLTV/eeEMGIKsxlbWMnJbZV87gn9Cslt5AUkhhh8L4f6fQNBM7wGX//c2axfBUA+3jXrXpkhrwev07EAO4AWCvySvsMctXuSvz9QF7e7OHa2EqLbuP088bGtKvq5lX+8m7AEQoF3ogRhNlplLTID5sBDyXss1K7hWqYI6KFCXsLmhljr1W0HfAWp4vfTgpMWC7BugfCEni8sz81jNPVR279CVNPme/gmzk+9oQl1i8DmnjUPyVrUPm5l75nNca0vJ7wtCOtOCK6/Q/aNWYL7mL9fCrJvHKSMTiD7WwdgXTH+bK6Qw0R0+hDPqh87hmPCpFfF+zOsJMKgtdijl9SficE3YBccA9QU0ut31yw17DeN0wccx/q1u2lyyPapZYqYD1P1LEsT331Twzi3ySAkpdTPWh70jJqXtS2F6bNSH8RBmlyetyMVzmwPHeFP15TLAcOzI5lMVehG03hoeE1i0toJS5KCfc/psA0MWPRPKRRjsMnna6DgVAineDo43M+/uPr5YW571EKf8l5q1jTdUdFCstWbDFHGZD9qR9Ux4TDj4qQOw6XlpCjfU/y90fWxyxbaAmZubx78Edb1/GwTZPw0ExggyQ== redde@Sivamani1234"

#security group variable value
sec_grp_name = "siva-sg"
sec_grp_des = "Allow TLS inbound traffic and all outbound traffic"
sec_grp_tag_name = "siva-sg"

#public EC2 instance variable values
pub_ec2_ami = "ami-0da8d411ad1002a94"
pub_ec2_ins_type = "t3.medium"
pub_ec2_key_name = "sivamani-key"
pub_ec2_ass_ipaddr = true

pub_ec2_az = "ap-northeast-3a"
pub_ec2_count = 1
pub_ec2_tag_name = "sivamani-jenkins"

volume_size = 30
volume_type = "gp2"
