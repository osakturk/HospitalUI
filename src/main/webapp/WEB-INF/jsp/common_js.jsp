<script src="vendor/jquery/jquery.min.js"></script>

<script type="text/template" id="textModalTemplate">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">%%TITLE%%</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">X</button>
    </div>
    <div class="modal-body">
        %%CONTENT%%
    </div>
    <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
    </div>
</script>

<script type="text/template" id="formModalTemplate">
    <form class="editForm" action="%%ACTION%%" method="%%METHOD%%">
        <div class="modal-header">
            <h5 class="modal-title" >%%TITLE%%</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">X</button>
        </div>
        <div class="modal-body">
            %%CONTENT%%
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" type="submit">Save</button>
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
        </div>
    </form>
</script>

<!-- Modal -->
<div class="modal fade" id="commonModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="formModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

        </div>
    </div>
</div>

<script type="text/javascript">
    /**
     * List of elements with attached event handlers
     * */
    var attached = {};

    /**
     * Data tables action button
     *
     * @param text
     * @param cls
     * @param callback
     * @param row
     */
    function Button(text, cls, callback, row) {
        this.elem = '<button type="button" id="'+cls+'row-'+row.id+'" class="btn btn-primary '+cls+'" row="'+row.id+'">'+text+'</button>';
        this.row = row;
        this.rowId = row.id;

        if (!attached.hasOwnProperty(cls+'row-'+row.id) ) {
            $(document).on('click', '#' + cls+'row-'+row.id, function(){
                callback();
            });

            attached[cls+'row-'+row.id] = true;
        }

        this.get = function() {
            return this.elem;
        }
    }

    /**
     * Populates modal with given title and data
     *
     * @param title
     * @param data
     */
    function populateModal(title, data) {
        var html = $('#textModalTemplate').html()
            .replace('%%TITLE%%', title);

        var dataHtml = '';
        for ( var key in data ){
            dataHtml += '<div class="col-6"><b>'+ key +' : </b>'+ data[key] +'</div>';
        }

        html = html.replace('%%CONTENT%%', dataHtml);

        $('#commonModal .modal-content').html(html);
        $('#commonModal').modal();
    }

    /**
     * Delete row from data tables.
     *
     * @param url
     * @param dataId
     */
    function deleteAction(url, dataId) {
        var c = confirm('Are you sure?');
        if( !c ) return;

        $.ajax({
            type: 'DELETE',
            url: url + '/' + dataId,
            dataType: 'json',
            crossDomain: true,
            responseType: 'application/json',
            headers: {
                "customerId": "3"
            },
            success: function(res) {
                location.reload();
            }
        })
    }

    /**
     * Create edit form modal
     *
     * @param title
     * @param url
     * @param method
     * @param dataId
     * @param data
     */
    function populateEditModal(title, url, method, dataId, data) {
        var html = $('#formModalTemplate').html()
            .replace('%%TITLE%%', title)
            .replace('%%METHOD%%', method)
            .replace('%%ACTION%%', url + '/' + dataId);

        var dataHtml = '';
        for ( var key in data ){
            if (key === 'id') continue;
            dataHtml += '<div class="form-group"><label>'+ key +'</label><input class="form-control" type="text" name='+ key +' value="'+data[key]+'"/></div>';
        }

        html = html.replace('%%CONTENT%%', dataHtml);

        $('#formModal .modal-content').html(html);
        $('#formModal').modal();
    }

    /**
     * Create store form modal
     *
     * @param title
     * @param url
     * @param method
     * @param data
     */
    function populateCreateModal(title, url, method, data) {
        var html = $('#formModalTemplate').html()
            .replace('%%TITLE%%', title)
            .replace('%%METHOD%%', method)
            .replace('%%ACTION%%', apiRoot);

        var dataHtml = '';
        for ( var key in data ){
            if (key === 'id') continue;
            dataHtml += '<div class="form-group"><label>'+ key +'</label><input class="form-control" type="text" name='+ key +'/></div>';
        }

        html = html.replace('%%CONTENT%%', dataHtml);

        $('#formModal .modal-content').html(html);
        $('#formModal').modal();
    }

    /**
     * Sends form request
     * @param method
     * @param action
     * @param data
     */
    function sendFormRequest(method, action, data) {
        $.ajax({
            type: method,
            url: action,
            data: data,
            crossDomain: true,
            responseType: 'application/json',
            headers: {
                "customerId": "3"
            },
            success: function(res) {
                location.reload();
            }
        })
    }

</script>