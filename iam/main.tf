provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_user" "myiamuser" {
  name = "Cam"
}

resource "aws_iam_policy" "myEFSPolicy" {
  name   = "EFSPolicy"
  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"elasticfilesystem:DescribeBackupPolicy",
				"elasticfilesystem:DescribeMountTargets",
				"elasticfilesystem:DescribeTags",
				"elasticfilesystem:DescribeReplicationConfigurations",
				"elasticfilesystem:ListTagsForResource",
				"elasticfilesystem:DescribeLifecycleConfiguration",
				"elasticfilesystem:ClientMount",
				"elasticfilesystem:DescribeFileSystemPolicy",
				"elasticfilesystem:DescribeAccessPoints",
				"elasticfilesystem:DescribeAccountPreferences",
				"elasticfilesystem:DescribeFileSystems",
				"elasticfilesystem:DescribeMountTargetSecurityGroups"
			],
			"Resource": "*"
		}
	]
}
  EOF
}

resource "aws_iam_policy" "myEC2Policy" {
  name   = "EC2Policy"
  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"ec2:AuthorizeSecurityGroupIngress",
				"ec2:ReplaceRouteTableAssociation",
				"ec2:ModifyManagedPrefixList",
				"ec2:CreateIpamPool",
				"ec2:ResetInstanceAttribute",
				"ec2:ResetEbsDefaultKmsKeyId",
				"ec2:ModifyVpnConnectionOptions",
				"ec2:ReleaseIpamPoolAllocation",
				"ec2:CreateCoipPoolPermission",
				"ec2:DeleteNetworkInsightsAnalysis",
				"ec2:UnassignPrivateIpAddresses",
				"ec2:DisableImageDeprecation",
				"ec2:DeleteLocalGatewayRouteTable",
				"ec2:DeleteTransitGatewayPeeringAttachment",
				"ec2:ImportKeyPair",
				"ec2:CreateInstanceConnectEndpoint",
				"ec2:CancelCapacityReservationFleets",
				"ec2:ProvisionIpamByoasn",
				"ec2:CreateVerifiedAccessEndpoint",
				"ec2:ReplaceNetworkAclAssociation",
				"ec2:CreateVpcEndpointServiceConfiguration",
				"ec2:ModifyInstanceMaintenanceOptions",
				"ec2:DeleteNatGateway",
				"ec2:CancelCapacityReservation",
				"ec2:EnableTransitGatewayRouteTablePropagation",
				"ec2:ModifyVpcEndpoint",
				"ec2:ModifyInstanceCapacityReservationAttributes",
				"ec2:CreatePublicIpv4Pool",
				"ec2:DeleteSpotDatafeedSubscription",
				"ec2:ImportVolume",
				"ec2:CreateVerifiedAccessGroup",
				"ec2:ModifyFleet",
				"ec2:DeleteLocalGatewayRouteTableVirtualInterfaceGroupAssociation",
				"ec2:RequestSpotFleet",
				"ec2:CreateSubnetCidrReservation",
				"ec2:DeleteTransitGatewayMulticastDomain",
				"ec2:DeleteVerifiedAccessInstance",
				"ec2:PurchaseCapacityBlock",
				"ec2:ModifyReservedInstances",
				"ec2:ReleaseAddress",
				"ec2:CreateTrafficMirrorTarget",
				"ec2:ModifyTrafficMirrorFilterRule",
				"ec2:CreateClientVpnRoute",
				"ec2:CreateLocalGatewayRoute",
				"ec2:SendSpotInstanceInterruptions",
				"ec2:ProvisionByoipCidr",
				"ec2:DisableSerialConsoleAccess",
				"ec2:DeprovisionIpamPoolCidr",
				"ec2:DeleteIpamScope",
				"ec2:DeleteVpcEndpointConnectionNotifications",
				"ec2:RestoreAddressToClassic",
				"ec2:DeleteCustomerGateway",
				"ec2:AssociateTransitGatewayPolicyTable",
				"ec2:ModifyVerifiedAccessEndpointPolicy",
				"ec2:ModifyVpcTenancy",
				"ec2:ApplySecurityGroupsToClientVpnTargetNetwork",
				"ec2:ConfirmProductInstance",
				"ec2:EnableEbsEncryptionByDefault",
				"ec2:PurchaseHostReservation",
				"ec2:ReplaceIamInstanceProfileAssociation",
				"ec2:DisassociateEnclaveCertificateIamRole",
				"ec2:UnassignPrivateNatGatewayAddress",
				"ec2:CreateTransitGatewayPrefixListReference",
				"ec2:ModifyTrafficMirrorSession",
				"ec2:DeleteTransitGatewayVpcAttachment",
				"ec2:CreateTransitGatewayPeeringAttachment",
				"ec2:AssociateTrunkInterface",
				"ec2:ReplaceNetworkAclEntry",
				"ec2:ModifyVpcPeeringConnectionOptions",
				"ec2:CreateTransitGatewayMulticastDomain",
				"ec2:CreateTrafficMirrorFilterRule",
				"ec2:ImportImage",
				"ec2:DeleteVpnConnection",
				"ec2:RejectVpcEndpointConnections",
				"ec2:ModifyEbsDefaultKmsKeyId",
				"ec2:ResetImageAttribute",
				"ec2:SendDiagnosticInterrupt",
				"ec2:DisableTransitGatewayRouteTablePropagation",
				"ec2:CreateVpcEndpointConnectionNotification",
				"ec2:AttachVerifiedAccessTrustProvider",
				"ec2:DisableAddressTransfer",
				"ec2:CreateTransitGatewayRouteTableAnnouncement",
				"ec2:AcceptAddressTransfer",
				"ec2:CreateCustomerGateway",
				"ec2:CreateIpam",
				"ec2:DeleteTransitGatewayRouteTable",
				"ec2:DeleteTransitGatewayRoute",
				"ec2:DeleteVpc",
				"ec2:DeleteCoipCidr",
				"ec2:CancelSpotFleetRequests",
				"ec2:DeleteTransitGatewayPolicyTable",
				"ec2:DeleteCoipPoolPermission",
				"ec2:CreateIpamResourceDiscovery",
				"ec2:ReplaceVpnTunnel",
				"ec2:ModifyInstanceAttribute",
				"ec2:CreateCoipCidr",
				"ec2:AttachClassicLinkVpc",
				"ec2:RestoreManagedPrefixListVersion",
				"ec2:CreateLaunchTemplateVersion",
				"ec2:DisableImageBlockPublicAccess",
				"ec2:StartVpcEndpointServicePrivateDnsVerification",
				"ec2:DeleteSecurityGroup",
				"ec2:CreateFpgaImage",
				"ec2:StartNetworkInsightsAccessScopeAnalysis",
				"ec2:AcceptReservedInstancesExchangeQuote",
				"ec2:DisassociateTrunkInterface",
				"ec2:EnableVpcClassicLinkDnsSupport",
				"ec2:AcceptTransitGatewayMulticastDomainAssociations",
				"ec2:DeleteSubnetCidrReservation",
				"ec2:CreateDhcpOptions",
				"ec2:ModifyVolumeAttribute",
				"ec2:DeleteClientVpnEndpoint",
				"ec2:DeleteLocalGatewayRouteTableVpcAssociation",
				"ec2:UpdateSecurityGroupRuleDescriptionsIngress",
				"ec2:DeleteRouteTable",
				"ec2:AllocateIpamPoolCidr",
				"ec2:RevokeSecurityGroupEgress",
				"ec2:RestoreSnapshotTier",
				"ec2:DeleteInternetGateway",
				"ec2:ModifyIpamResourceDiscovery",
				"ec2:DeleteVerifiedAccessGroup",
				"ec2:DeprovisionIpamByoasn",
				"ec2:BundleInstance",
				"ec2:DisableFastSnapshotRestores",
				"ec2:CreateTags",
				"ec2:CreateLocalGatewayRouteTableVpcAssociation",
				"ec2:ModifySecurityGroupRules",
				"ec2:DisassociateRouteTable",
				"ec2:RevokeSecurityGroupIngress",
				"ec2:CreateDefaultVpc",
				"ec2:CreateSnapshots",
				"ec2:DeleteIpamPool",
				"ec2:CreateLocalGatewayRouteTablePermission",
				"ec2:ModifyLocalGatewayRoute",
				"ec2:ModifyVpnConnection",
				"ec2:ModifyIpamScope",
				"ec2:RejectTransitGatewayPeeringAttachment",
				"ec2:CreateDefaultSubnet",
				"ec2:EnableReachabilityAnalyzerOrganizationSharing",
				"ec2:CreateInstanceExportTask"
			],
			"Resource": "*"
		}
	]
}
EOF
}

resource "aws_iam_policy" "myGlacierPolicy" {
  name   = "GlacierPolicy"
  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"glacier:InitiateJob",
				"glacier:AbortMultipartUpload",
				"glacier:CreateVault",
				"glacier:ListTagsForVault",
				"glacier:DeleteVault",
				"glacier:DeleteArchive",
				"glacier:ListParts",
				"glacier:DeleteVaultNotifications",
				"glacier:ListJobs",
				"glacier:ListMultipartUploads",
				"glacier:SetVaultNotifications",
				"glacier:CompleteMultipartUpload",
				"glacier:InitiateMultipartUpload",
				"glacier:UploadMultipartPart",
				"glacier:PurchaseProvisionedCapacity",
				"glacier:UploadArchive",
				"glacier:ListVaults",
				"glacier:ListProvisionedCapacity"
			],
			"Resource": "*"
		}
	]
}
EOF
}

resource "aws_iam_policy_attachment" "bindEC2Policy" {
  name       = "attachec2"
  users = [aws_iam_user.myiamuser.name]
  policy_arn = aws_iam_policy.myEC2Policy.arn
}

resource "aws_iam_policy_attachment" "bindEFSPolicy" {
  name       = "attachefs"
  users = [aws_iam_user.myiamuser.name]
  policy_arn = aws_iam_policy.myEFSPolicy.arn
}


resource "aws_iam_policy_attachment" "bindGlacierPolicy" {
  name       = "attachglacier"
  users = [aws_iam_user.myiamuser.name]
  policy_arn = aws_iam_policy.myGlacierPolicy.arn
}
