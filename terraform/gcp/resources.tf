//resource "google_monitoring_dashboard" "dashboard" {
  //dashboard_json = file("node_dash.json")
  //project = var.project
              
//}


//k8s_node - kubernetes.io/node/cpu/allocatable_utilization
//gcloud beta monitoring channels list --sort-by=name --format="value(name)" 




  locals {
    channels={
      "a" = "franky1@.com",
      "b" = "franky2@.com", 
      "c" = "franky3@.com"
    }
  }
  
resource "google_monitoring_notification_channel" "noti_channel" {
  for_each = local.channels
  display_name = "test -${each.key}"
  type = "email"
  labels = {
    email_address="${each.value}"
  }
  
}

resource "google_monitoring_alert_policy" "allocatable_cpu_node" {
  display_name = "Allocatable cpu"
  combiner     = "OR"
  documentation {
      content = "testing 1.5 alert"
  }
  notification_channels = values(google_monitoring_notification_channel.noti_channel)[*].id
  conditions {
    display_name = "node_cpu"
    condition_threshold {
      filter     = "metric.type=\"kubernetes.io/node/cpu/allocatable_utilization\" AND resource.type=\"k8s_node\""
      duration   = "60s"
      threshold_value = 1.5
      trigger {
        count = "1"
      }
      comparison = "COMPARISON_GT"
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    

    

      
      
    }
  
  }
}








output "monitoring_output" {
 value = google_monitoring_alert_policy.allocatable_cpu_node

}

output "foreach" {
  value=google_monitoring_notification_channel.noti_channel
}



//"name": "${jsonencode(google_monitoring_alert_policy.alerta_policy.id)}"

  
//locals {
  //id_alert=google_monitoring_alert_policy.alert_policy.id
//}

