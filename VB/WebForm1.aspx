<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="WebForm1.aspx.vb" Inherits="WebApplication1.WebForm1" %>

<%@ Register Assembly="DevExpress.Dashboard.v17.1.Web, Version=17.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function OnItemWidgetCreated(s, args) {
            if (args.ItemName == "pivotDashboardItem1") {
                var pivot = args.GetWidget();
                var defaultCP = pivot.option('onCellPrepared');
                pivot.option("onCellPrepared", function (e) {
                    defaultCP(e)
                    if (e.area === 'row') {
                        e.cellElement[0].style.fontFamily = "Times New Roman";
                        e.cellElement[0].style.fontSize = "20px";
                        e.cellElement[0].style.background = "LightCyan";
                    }
                    if (e.area === 'data') {
                        debugger;
                        e.cellElement[0].style.fontFamily = "Areal";
                        e.cellElement[0].style.fontSize = "25px";
                        e.cellElement[0].style.background = "green";
                    }
                });
                pivot.repaint();
            }
        }
        function GetShotDateText(value){
            locale = "en-us";
            var month = value.toLocaleString(locale, { month: "short" });
            return month + ', ' + value.getFullYear();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxDashboardViewer ClientInstanceName="viewer" ID="ASPxDashboardViewer1" runat="server" DashboardSource="WebApplication1.Dashboard1" Height="600px" OnDataLoading="ASPxDashboardViewer1_DataLoading" Width="800px">
            <ClientSideEvents ItemWidgetCreated="OnItemWidgetCreated" />
        </dx:ASPxDashboardViewer>
    </div>
    </form>
</body>
</html>