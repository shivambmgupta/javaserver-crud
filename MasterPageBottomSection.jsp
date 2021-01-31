</div>    <!-- MiddleDIVISON ENDS HERE -->

  <div class='delete_div 'id='delete_div' style='display: none;'>
    <form id='deleteForm' name='deleteFrom' action='/styletwo/deleteStudent.jsp'>
      Name:&nbsp;
      <input type='text' readonly id='DeleteDivNameLable' />
      <br>
      RollNumber:&nbsp;
      <input type='text' name='rollNumber' readonly id='DeleteDivRollNumberLable' />
      <br>
      Gender:&nbsp;
      <span id='DeleteDivGenderLable'></span>
      <br>
      Indian:&nbsp;
      <span id='DeleteDivIndianLable'></span>
      <br>
      Address:&nbsp;
      <span id='DeleteDivAddressLable'></span>
      <br>
      <button type='submit'>Delete</button>
    </form>
  </div>

   <div class='right_div' id='right_div' text-align: 'centre'>
     <div style='position: absolute;width: 90%; min-height:68%; top: 30%; left: 10%;'>
        <center><i><b>Details</b></i></center>
        Name:&nbsp;
        <span id='RightDivNameLable'></span>
        <br>
        RollNumber:&nbsp;
        <span id='RightDivRollNumberLable'></span>
        <br>
        Gender:&nbsp;
        <span id='RightDivGenderLable'></span>
        <br>
        Indian:&nbsp;
        <span id='RightDivIndianLable'></span>
        <br>
        Address:&nbsp;
        <span id='RightDivAddressLable'></span>
        <br>
    </div>
   </div>  <!-- Right divison ends here -->
   
  <div class='edit_div' id='edit_div' style='display: none;'>
    <form id='editForm' name='editFrom' action='/styletwo/editStudent.jsp'>
      Name:&nbsp;
      <input type='text' name='name' id='EditDivNameLable'/>
      <br>
      RollNumber:&nbsp;
      <input type='text' name='rollNumber' readonly id='EditDivRollNumberLable' />
      <br>
      Gender:&nbsp;
      <input type='radio' name='gender' id='EditDivGenderMaleLable' value='Male' />Male&nbsp;&nbsp;
      <input type='radio' name='gender' id='EditDivGenderFemaleLable' value='Female' />Female
      <br>
      Indian:&nbsp;
      <input type='checkbox' name='indian' id='EditDivIndianLable' />
      <br>
      Address:&nbsp;
      <textarea name='address' id='EditDivAddressLable' rows=10 col=10></textarea>
      <br>
      <button type='submit'>Update</buttom>
    </form>
  </div>

  <div class='add_div' id='add_div' style='display: none;'>
    <form id='addForm' name='addFrom' action='/styletwo/addStudent.jsp'>
      Name:&nbsp;
      <input type='text' name='name' id='AddDivNameLable'/>
      <br>
      RollNumber:&nbsp;
      <input type='text' name='rollNumber' id='AddDivRollNumberLable' />
      <br>
      Gender:&nbsp;
      <input type='radio' name='gender' id='AddDivGenderMaleLable' value='Male' />Male&nbsp;&nbsp;
      <input type='radio' name='gender' id='AddDivGenderFemaleLable' value='Female' />Female
      <br>
      Indian:&nbsp;
      <input type='checkbox' name='indian' id='AddDivIndianLable' />
      <br>
      Address:&nbsp;
      <textarea name='address' id='AddDivAddressLable' rows=10 col=10></textarea>
      <br>
      <button type='submit'>Add Student</buttom>
    </form>
  </div>

  </div>     <!-- BODY DIVISON ENDS HERE -->
</div> <!-- CONTAINER_DIVISION ENDS HERE -->

    <div class='footer_div'></div>
  </body>
</html>