<jsp:include page="header.jsp"/>
<!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">Appointments</h1>


<div class="card shadow mb-4">
    <div class="card-header py-3">
        <button type="button" class="btn btn-primary create-btn">+ Create</button>
    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Created At</th>
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

    var apiRoot = 'http://localhost:8080/api/appointments';
    var DataTablesProps = {
        api: apiRoot,
        wrappedKey: 'appointments',
        columns: [
            { data: 'id' },
            { data: 'date' },
            { data: "cb1" ,
                render : function ( data, type, row, meta ) {
                    var patientButton = new Button('Patient', 'patient', function(){
                        populateModal('Patient', row.patient);
                    }, row).get();

                    var hospitalButton = new Button('Hospital', 'hospital', function(){
                        populateModal('Hospital', row.hospital);
                    }, row).get();


                    var drButton = new Button('Doctor', 'doctor', function(){
                        populateModal('Doctor', row.doctor);
                    }, row).get();


                    return patientButton + ' ' + drButton + ' ' + hospitalButton;
                }
            }
        ]
    };

    $('.create-btn').click(function() {
        populateCreateModal('Appointments', apiRoot, 'POST', PageData[0]);
    });

</script>

<jsp:include page="footer.jsp"/>
