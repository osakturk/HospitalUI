var PageData;
$(document).ready(function() {
  $.ajax({
    type: "GET",
    url: DataTablesProps.api,
    dataType: 'json',
    crossDomain: true,
    responseType: 'application/json',
    headers: {
      "customerId": "3"
    },
    success: function (res, textstatus) {
      console.log(res);
      PageData = res[DataTablesProps.wrappedKey];
      $('#dataTable').DataTable({
        data: res[DataTablesProps.wrappedKey],
        columns: DataTablesProps.columns
      });
    },
    error: function (obj, textstatus) {
      console.log('dt error');
    }
  });
});
