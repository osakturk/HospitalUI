<jsp:include page="header.jsp"/>
<!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">Patients</h1>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <button type="button" class="btn btn-primary create-btn">+ Create</button>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>

<jsp:include page="common_js.jsp"/>
<script type="text/javascript">

    var apiRoot = 'http://localhost:8080/api/patients';
    var DataTablesProps = {
      api: apiRoot,
      wrappedKey: 'patients',
      columns: [
          { data: 'name' },
          { data: 'emailId' },
          { data: 'contactNumber' },
          { data: 'gender' },
          { data: 'address' },
          { data: "cb1" ,
              render : function ( data, type, row, meta ) {
                var diseaseButton = new Button('Disease', 'disease', function(){
                    populateModal('Disease', row.disease);
                }, row).get();

                var drButton = new Button('Doctor', 'doctor', function(){
                    populateModal('Doctor', row.doctor);
                }, row).get();


                return diseaseButton + ' ' + drButton;
              }
          }
      ]
    };

    $('.create-btn').click(function() {
        populateCreateModal('Patients', apiRoot, 'POST', PageData[0]);
    });

</script>

<jsp:include page="footer.jsp"/>
