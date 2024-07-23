# Example of Installing Ruby (and Ruby on Rails) on OCI

[![License: UPL](https://img.shields.io/badge/license-UPL-green)](https://img.shields.io/badge/license-UPL-green) [![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=oracle-devrel_terraform-oci-ruby)](https://sonarcloud.io/dashboard?id=oracle-devrel_terraform-oci-ruby)

## Introduction
This article compliments the [article](https://medium.com/oracledevs/getting-started-with-ruby-and-ruby-on-rails-on-oci-3ce2d4c65833) that shows how to deploy Ruby and Ruby on Rails (aka RoR/Rails) on an OCI Compute instance.  This is a sample implementation that provides a Ruby runtime (of your choosing) and optional Rails installation.

## Getting Started
You must have an OCI account.  [Click here](https://www.oracle.com/cloud/free/?source=:ex:tb:::::WWMK220126P00007&SC=:ex:tb:::::WWMK220126P00007&pcode=WWMK220126P00007) to create a new cloud account.

There are a couple of options for deploying this project:
* Oracle Cloud Resource Manager
* Terraform CLI
* Oracle Cloud Shell

**NOTE:** Regardless of which deployment method you choose, make sure that you select the correct Compute Instance shape and the Compute Image to go with it.  See [https://docs.oracle.com/en-us/iaas/images/](https://docs.oracle.com/en-us/iaas/images/?source=:ex:tb:::::WWMK220126P00007&SC=:ex:tb:::::WWMK220126P00007&pcode=WWMK220126P00007) for a list of available Compute Images.

**This solution was built to use Oracle Linux... if you choose a different Linux distribution, your mileage may vary (a reasonable expectation would be that it might *not* work out-of-the-box).**

### Oracle Cloud Resource Manager
This is really easy to do!  Simply click [![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?region=home&zipUrl=https://github.com/oracle-devrel/terraform-oci-ruby/releases/latest/download/terraform-oci-ruby-orm.zip) and follow the on-screen prompts.

Make sure to apply the stack, by either checking the box during its creation or manually after it is created.

### Terraform CLI
Clone this repo:

```
git clone https://github.com/oracle-devrel/terraform-oci-ruby
```

Copy `terraform.tfvars.template` to `terraform.tfvars`, then modify the contents (fill-in-the-blanks for your tenancy).

Run `terraform init`.  Review what Terraform thinks should be done by running `terraform plan` and if you're satisified with it, then run `terraform apply`.

### Oracle Cloud Shell
Follow the same directions used for Terraform CLI (above), however you'll need to modify the contents of the `provider.tf` file first.  Look at the comment blocks, commenting out the lines used for Terraform CLI and uncommenting the line(s) needed for Cloud Shell.  Once this is done, proceed with the same steps (`terraform init`, `terraform plan` and then `terraform apply` if you're happy with what it's proposing be done).

## Using it
It's *really* simple.  This will deploy the Ruby runtime you selected, as well as Rails (if you opted to have it do so).  Login to the OCI instance with something like the following:

```
ssh -i <your_priv_key> opc@<public_ip>
```

You should see `ruby -v` and `rails -v` give you meaningful output (ie. they work).  Since `rbenv` is installed, you can use it to manage your Ruby runtimes going forward.

You'll likely want to access a local development web server (such as Puma in development mode, that happens when you run `rails s`).  To easily do this (using the standard defaults), something like the following might work:

```
ssh -i <your_priv_key> -L 3000:localhost:3000 opc@<public_ip>
```

This sets up port forwarding for port 3000 to your local machine, so you simply need to point your web browser to http://localhost:3000 (same as if you were running Rails in development mode locally).

Have fun with it!

### Prerequisites
You must have an OCI account.  [Click here](https://www.oracle.com/cloud/free/?source=:ex:tb:::::WWMK220126P00007&SC=:ex:tb:::::WWMK220126P00007&pcode=WWMK220126P00007) to create a new cloud account.


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 4.60.0 |
| <a name="provider_oci.home"></a> [oci.home](#provider\_oci.home) | 4.60.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_instance.ruby](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_instance) | resource |
| [oci_core_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_internet_gateway) | resource |
| [oci_core_network_security_group.ruby](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group) | resource |
| [oci_core_network_security_group_security_rule.outbound_https](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_route_table.public](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_route_table) | resource |
| [oci_core_subnet.this](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_subnet) | resource |
| [oci_core_vcn.this](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_vcn) | resource |
| [oci_identity_tag.release](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/identity_tag) | resource |
| [oci_identity_tag_namespace.devrel](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/identity_tag_namespace) | resource |
| [random_id.tag](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [oci_core_images.latest_ol8](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_images) | data source |
| [oci_core_images.specified](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_images) | data source |
| [oci_core_images.this](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_images) | data source |
| [oci_identity_availability_domains.ads](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_availability_domains) | data source |
| [oci_identity_region_subscriptions.home_region_subscriptions](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_region_subscriptions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ad_number"></a> [ad\_number](#input\_ad\_number) | The AD number to deploy the Compute instance in.  1 = AD1, 2 = AD2, 3 = AD3. | `number` | n/a | yes |
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | The compartment OCID to deploy resources to | `string` | `""` | no |
| <a name="input_compute_image_name"></a> [compute\_image\_name](#input\_compute\_image\_name) | The name of the compute image to use for the compute instances. | `string` | `""` | no |
| <a name="input_compute_shape"></a> [compute\_shape](#input\_compute\_shape) | See https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm for the different compute shapes available. | `string` | `"VM.Standard.A1.Flex"` | no |
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | 'API Key' fingerprint, more details can be found at https://docs.cloud.oracle.com/en-us/iaas/Content/General/Concepts/credentials.htm#two | `string` | `""` | no |
| <a name="input_install_rails"></a> [install\_rails](#input\_install\_rails) | Whether or not to install Rails. | `bool` | `true` | no |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | The private key (provided as a string value) | `string` | `""` | no |
| <a name="input_private_key_password"></a> [private\_key\_password](#input\_private\_key\_password) | The password to use for the private key | `string` | `""` | no |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | Path to private key used to create OCI 'API Key', more details can be found at https://docs.cloud.oracle.com/en-us/iaas/Content/General/Concepts/credentials.htm#two | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | OCI Region as documented at https://docs.cloud.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm | `string` | `"us-phoenix-1"` | no |
| <a name="input_ruby_version"></a> [ruby\_version](#input\_ruby\_version) | The version of Ruby to install (guess that rbenv has whatever's on www.ruby-lang.org or check out 'rbenv install -L' from another machine). | `string` | `"3.1.0"` | no |
| <a name="input_ssh_pub_key"></a> [ssh\_pub\_key](#input\_ssh\_pub\_key) | The SSH public key contents to use for the compute instances. | `string` | `""` | no |
| <a name="input_ssh_pub_key_path"></a> [ssh\_pub\_key\_path](#input\_ssh\_pub\_key\_path) | The path to the SSH public key to use for the compute instances. | `string` | `""` | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | OCI tenant OCID, more details can be found at https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm#five | `any` | n/a | yes |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | OCI user OCID, more details can be found at https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm#five | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pub_ip"></a> [pub\_ip](#output\_pub\_ip) | n/a |
| <a name="output_ssh_cmd"></a> [ssh\_cmd](#output\_ssh\_cmd) | n/a |

## Notes/Issues
None at this time.

## URLs
* https://medium.com/oracledevs/getting-started-with-ruby-and-ruby-on-rails-on-oci-3ce2d4c65833

## Contributing
This project is open source.  Please submit your contributions by forking this repository and submitting a pull request!  Oracle appreciates any contributions that are made by the open source community.

## License
Copyright (c) 2024 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](LICENSE) for more details.

ORACLE AND ITS AFFILIATES DO NOT PROVIDE ANY WARRANTY WHATSOEVER, EXPRESS OR IMPLIED, FOR ANY SOFTWARE, MATERIAL OR CONTENT OF ANY KIND CONTAINED OR PRODUCED WITHIN THIS REPOSITORY, AND IN PARTICULAR SPECIFICALLY DISCLAIM ANY AND ALL IMPLIED WARRANTIES OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSE.  FURTHERMORE, ORACLE AND ITS AFFILIATES DO NOT REPRESENT THAT ANY CUSTOMARY SECURITY REVIEW HAS BEEN PERFORMED WITH RESPECT TO ANY SOFTWARE, MATERIAL OR CONTENT CONTAINED OR PRODUCED WITHIN THIS REPOSITORY. IN ADDITION, AND WITHOUT LIMITING THE FOREGOING, THIRD PARTIES MAY HAVE POSTED SOFTWARE, MATERIAL OR CONTENT TO THIS REPOSITORY WITHOUT ANY REVIEW. USE AT YOUR OWN RISK. 