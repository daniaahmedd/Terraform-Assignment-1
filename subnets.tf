resource "oci_core_subnet" "PROD_CRM_APP_SUBNET" {
    cidr_block = "10.10.1.0/24"
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.PROD_CRM_VCN.id
    display_name = "PROD_CRM_APP_SUBNET"
    prohibit_public_ip_on_vnic = true #Private Subent
}

resource "oci_core_subnet" "PROD_CRM_WEB" {
    cidr_block = "10.10.2.0/24"
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.PROD_CRM_VCN.id
    display_name = "PROD_CRM_WEB_SUBNET"
    prohibit_public_ip_on_vnic = false #Public Subent
}

resource "oci_core_subnet" "PROD_CRM_DB" {
    cidr_block = "10.10.3.0/24"
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.PROD_CRM_VCN.id
    display_name = "PROD_CRM_DB_SUBNET"
    prohibit_public_ip_on_vnic = true #Private Subent
}