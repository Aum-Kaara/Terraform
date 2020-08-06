//Failed EventHub Events
resource "azurerm_monitor_metric_alert" "failedeventhub_alert" {
  count               = var.failedeventhub_threshold != null ? 1 : 0
  name                = "${var.api_management_name}-failedeventhub-alert"
  resource_group_name = var.resource_group_name
  scopes              = [var.api_management_id]

  criteria {
    aggregation       = "Total"
    metric_name       = "EventHubTotalFailedEvents"
    metric_namespace  = "Microsoft.ApiManagement/service"
    operator          = "GreaterThanOrEqual"
    threshold         = var.failedeventhub_threshold
  }

  severity            = 3
  auto_mitigate       = true
  frequency           = "PT5M"
  window_size         = "PT15M"

  tags = {
    env              = var.environment
    area             = var.area_prefix
    application      = var.api_management_name
    app_version      = var.app_version
  }

  action {
    action_group_id   = var.action_group_id
  }
}

//Rejected EventHub Events
resource "azurerm_monitor_metric_alert" "rejectedeventhub_alert" {
  count               = var.rejectedeventhub_threshold != null ? 1 : 0
  name                = "${var.api_management_name}-rejectedeventhub-alert"
  resource_group_name = var.resource_group_name
  scopes              = [var.api_management_id]

  criteria {
    aggregation       = "Total"
    metric_name       = "EventHubRejectedEvents"
    metric_namespace  = "Microsoft.ApiManagement/service"
    operator          = "GreaterThanOrEqual"
    threshold         = var.rejectedeventhub_threshold
  }

  severity            = 3
  auto_mitigate       = true
  frequency           = "PT5M"
  window_size         = "PT15M"

  tags = {
    env              = var.environment
    area             = var.area_prefix
    application      = var.api_management_name
    app_version      = var.app_version
  }

  action {
    action_group_id   = var.action_group_id
  }
}

//Timedout EventHub Events
resource "azurerm_monitor_metric_alert" "timedouteventhub_alert" {
  count               = var.timedouteventhub_threshold != null ? 1 : 0
 name                = "${var.api_management_name}-timedouteventhub-alert"
  resource_group_name = var.resource_group_name
  scopes              = [var.api_management_id]

  criteria {
    aggregation       = "Total"
    metric_name       = "EventHubTimedoutEvents"
    metric_namespace  = "Microsoft.ApiManagement/service"
    operator          = "GreaterThanOrEqual"
    threshold         = var.timedouteventhub_threshold
  }

  severity            = 3
  auto_mitigate       = true
  frequency           = "PT5M"
  window_size         = "PT15M"

  tags = {
    env              = var.environment
    area             = var.area_prefix
    application      = var.api_management_name
    app_version      = var.app_version
  }

  action {
    action_group_id   = var.action_group_id
  }
}

//Dropped EventHub Events
resource "azurerm_monitor_metric_alert" "droppedeventhub_alert" {
  count               = var.droppedeventhub_threshold != null ? 1 : 0
  name                = "${var.api_management_name}-droppedeventhub-alert"
  resource_group_name = var.resource_group_name
  scopes              = [var.api_management_id]

  criteria {
    aggregation       = "Total"
    metric_name       = "EventHubDroppedEvents"
    metric_namespace  = "Microsoft.ApiManagement/service"
    operator          = "GreaterThanOrEqual"
    threshold         = var.droppedeventhub_threshold
  }

  severity            = 3
  auto_mitigate       = true
  frequency           = "PT5M"
  window_size         = "PT15M"

  tags = {
    env              = var.environment
    area             = var.area_prefix
    application      = var.api_management_name
    app_version      = var.app_version
  }

  action {
    action_group_id   = var.action_group_id
  }
}

//Capacity
resource "azurerm_monitor_metric_alert" "high_cpacity_alert" {
  count               = var.high_cpacity_threshold !=null ? 1 : 0
  name                = "${var.api_management_name}-highcapacity-alert"
  resource_group_name = var.resource_group_name
  scopes              = [var.api_management_id]

  criteria {
    aggregation       = "Average"
    metric_name       = "Capacity"
    metric_namespace  = "Microsoft.ApiManagement/service"
    operator          = "GreaterThanOrEqual"
    threshold         = var.high_cpacity_threshold
  }

  severity            = 3
  auto_mitigate       = true
  frequency           = "PT5M"
  window_size         = "PT15M"

  tags = {
    env              = var.environment
    area             = var.area_prefix
    application      = var.api_management_name
    app_version      = var.app_version
  }

  action {
    action_group_id   = var.action_group_id
  }
}
//Backend Response Alert 5xx
resource "azurerm_monitor_metric_alert" "backend_response_alert_5xx" {
  count               = var.backend_response_threshold != null ? 1 : 0
  name                = "${var.api_management_name}-backend-response-alert"
  resource_group_name = var.resource_group_name
  scopes              = [var.api_management_id]

  criteria {
    aggregation       = "Total"
    metric_name       = "Requests"
    metric_namespace  = "Microsoft.ApiManagement/service"
    operator          = "GreaterThanOrEqual"
    threshold         =  var.backend_response_threshold

    dimension {
      name          = "BackendResponseCode"
      operator      = "Include"
      values        = ["5xx"]
    }
  }

  severity            = 3
  auto_mitigate       = true
  frequency           = "PT5M"
  window_size         = "PT15M"

  tags = {
    application      = var.api_management_name
  }

  action {
    action_group_id   = var.action_group_id
  }
}

//Gateway Response Alert 5xx
resource "azurerm_monitor_metric_alert" "gateway_response_alert_5xx" {
  count               = var.gatewayresponse_threshold != null ? 1 : 0
  name                = "${var.api_management_name}-gateway-response-alert"
  resource_group_name = var.resource_group_name
  scopes              = [var.api_management_id]

  criteria {
    aggregation       = "Total"
    metric_name       = "Requests"
    metric_namespace  = "Microsoft.ApiManagement/service"
    operator          = "GreaterThanOrEqual"
    threshold         = var.gatewayresponse_threshold

    dimension {
      name          = "GatewayResponseCode"
      operator      = "Include"
      values        = ["5xx"]
    }
  }

  severity            = 3
  auto_mitigate       = true
  frequency           = "PT5M"
  window_size         = "PT15M"

  tags = {
    env              = var.environment
    area             = var.area_prefix
    application      = var.api_management_name
    app_version      = var.app_version
  }

  action {
    action_group_id   = var.action_group_id
  }
}

