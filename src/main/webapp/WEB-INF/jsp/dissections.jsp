<jsp:include page="header.jsp"/>
<!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">Dissections</h1>

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
                    <th>Name</th>
                    <th>Date</th>
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

    var apiRoot = 'http://localhost:8080/api/dissections';
    var DataTablesProps = {
        api: apiRoot,
        wrappedKey: 'dissections',
        columns: [
            { data: 'id' },
            { data: 'name' },
            { data: 'date' },
            { data: "cb1" ,
                render : function ( data, type, row, meta ) {
                    var deleteBtn = new Button('Delete', 'delete', function(){
                        deleteAction(apiRoot, row.id);
                    }, row).get();

                    var editBtn = new Button('Edit', 'edit', function(){
                        populateEditModal('Edit Dissection', apiRoot, 'PUT', row.id, row);
                    }, row).get();

                    return editBtn + ' ' + deleteBtn;
                }
            }
        ]
    };

    $('.create-btn').click(function() {
        populateCreateModal('Dissections', apiRoot, 'POST', PageData[0]);
    });

</script>

<jsp:include page="footer.jsp"/>
