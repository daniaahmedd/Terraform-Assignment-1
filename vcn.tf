resource "oci_core_vcn" "PROD_CRM_VCN" {
    #Required
    compartment_id = var.compartment_ocid
    cidr_block = "10.10.0.0/16"
    display_name = "PROD_CRM_VCN"
    dns_label = "dania"
    is_ipv6enabled = false
}

locals {
  PROD_CRM_VCN_default_route_table = oci_core_vcn.PROD_CRM_VCN.default_route_table_id
}

resource "oci_core_security_list" "test_security_list" {
    #Required
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.PROD_CRM_VCN.id

    display_name = "PROD_CRM_VCN_SL"
    egress_security_rules {
        destination = "0.0.0.0/0"
        protocol = "6"
        icmp_options {
            type = 8
        }
        tcp_options {
            source_port_range {
                max = 65535
                min = 1
            }
        }
        udp_options {
            source_port_range {
                max = 65535
                min = 1
            }
        }
    }

    ingress_security_rules {
        protocol = "6"
        source = "0.0.0.0/0"
        icmp_options {
            type = 8
        }
        tcp_options {
            source_port_range {
                max = 65535
                min = 1
            }
        }
        udp_options {
            source_port_range {
                max = 65535
                min = 1
            }
        }
    }
}