<form action='$SELF_URL' method='GET' class='form-horizontal container-md' id='ACCIDENT_LOG'>
    <input type='hidden' name='index' value='%INDEX%'>
    <input type='hidden' name='search' value='1'>

    <div class='col-md-6 form-group row'>
        <label class='col-md-4 col-form-label text-md-right' for='FIO'>_{FIO}_:</label>
        <div class='col-md-8'>
            <div class='input-group'>
                <input type='text' id='NAME' name='NAME' value='%NAME%'
                       class='form-control'>
                <div class='input-group-append'>
                    <div class='input-group-text clear_results' style='cursor:pointer;'>
                        <span class='fa fa-remove'></span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class='col-md-6 form-group row'>
        <label class='col-md-4 col-form-label text-md-right' for='ADDRESS_STREET'>_{ADDRESS_STREET}_:</label>
        <div class='col-md-8'>
            <div class='input-group'>
                <input type='text' id='ADDRESS_STREET' name='ADDRESS_STREET' value='%ADDRESS_STREET%'
                       class='form-control'>
                <div class='input-group-append'>
                    <div class='input-group-text clear_results' style='cursor:pointer;'>
                        <span class='fa fa-remove'></span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class='card-footer'>
       <input class='btn btn-primary' type='submit' name='search' value='_{SEARCH}_'>
    </div>
</form>