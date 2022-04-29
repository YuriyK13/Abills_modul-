<form action='$SELF_URL' class='form-horizontal' METHOD='POST'>
  <input type=hidden name='index' value='$index'>
   <input type='hidden' name='ID' value='%ID%'>

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
      <!-- ACTION BTN -->
      <button type='submit' name='add' value='add' class='btn btn-primary float-center'>Registration</button>
    </div>

</form>