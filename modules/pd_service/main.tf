resource "pagerduty_service" "example" {
  name                    = "My Web App"
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = 600
  escalation_policy       = pagerduty_escalation_policy.foo.id
  alert_creation          = "create_alerts_and_incidents"

  auto_pause_notifications_parameters {
    enabled = true
    timeout = 300
  }
}
