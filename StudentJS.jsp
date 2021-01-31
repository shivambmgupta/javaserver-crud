<%@taglib uri='/WEB-INF/mytags.tld' prefix='tm' %>
   <script>

      function City() {
         this.name = '';
         this.code = 0;
      }
      function Student() {
         this.name = '';
         this.rollNumber = 0;
         this.indian = '';
         this.gender = '';
         this.address = '';
      }
      function DataModel() {
         this.students = [];
      }

      function statusLabel() {
         var statusMessageSpan = document.getElementById("statusSpan").innerHTML;
         if (statusMessageSpan == "") return;
         if (statusMessageSpan.search("not") != -1 || statusMessageSpan.search("Not") != -1 || statusMessageSpan.search("Error") != -1 || statusMessageSpan.search("error") != -1) {
            document.getElementById("statusSpan").style.color = 'red';
         }
         else {
            document.getElementById("statusSpan").style.color = 'green';
         }
      }
      window.addEventListener('load', statusLabel);
      function HideLabel() {
         document.getElementById("statusSpan").style.display = 'none';
      }
      setTimeout(HideLabel, 5000);


      var dataModel = new DataModel();
      function initView() {
         var s;
         <tm:TableIterator table='student' name='student' orderby=''>
            s=new Student();
            s.rollNumber=${student.rollNumber};
            s.name='${student.name}';
            s.gender='${student.gender}';
            s.address='${student.address}';
            s.indian='${student.indian}';
            dataModel.students[${index}]=s;
         </tm:TableIterator >

        var a, tr, td, table, image, i = 0;
        var textNode;
        student_table = document.getElementById('student_table');
        while (i < dataModel.students.length) {
            tr = document.createElement('tr');
            td = document.createElement('td');
            textNode = document.createTextNode((i + 1) + ".");
            td.appendChild(textNode);
            tr.appendChild(td);
            td = document.createElement('td');
            textNode = document.createTextNode(dataModel.students[i].rollNumber);
            td.appendChild(textNode);
            tr.appendChild(td);
            td = document.createElement('td');
            textNode = document.createTextNode(dataModel.students[i].name);
            td.appendChild(textNode);
            tr.appendChild(td);
            td = document.createElement('td');
            image = document.createElement('img');
            if (dataModel.students[i].gender == 'Male') image.src = '/styleone/images/male.png';
            else image.src = '/styleone/images/female.png';
            td.appendChild(image);
            tr.appendChild(td);
            td = document.createElement('td');
            image = document.createElement('img');
            if (dataModel.students[i].indian == 'Yes') image.src = '/styleone/images/check-box.png';
            else if (dataModel.students[i].indian == 'No') image.src = '/styleone/images/uncheck-box.png';
            td.appendChild(image);
            tr.appendChild(td);


            td = document.createElement('td');
            image = document.createElement('img');
            image.src = '/styleone/images/edit.png';
            td.onclick = editSectionHandler(i, td);
            td.appendChild(image);
            tr.appendChild(td);

            td = document.createElement('td');
            image = document.createElement('img');
            image.src = '/styleone/images/delete.png';
            td.onclick = deleteSectionHandler(i, td);
            td.appendChild(image);
            tr.appendChild(td);

            tr.style.cursor = 'pointer';
            tr.onclick = rowSelectionHandler(i + 1, tr);
            student_table.appendChild(tr);
            i++;
         }
      }
      window.addEventListener('load', initView);

      function rowSelectionHandler(index, table_row) {
         return function () { selectRow(index, table_row); };
      }
      var selectedRow = null;
      function selectRow(index, table_row) {
         --index;
         if (table_row == selectedRow) return;
         if (selectedRow == null) {
            selectedRow = table_row;
            selectedRow.style.background = 'yellow';
         } else {
            selectedRow.style.background = 'white';
            selectedRow = table_row;
            selectedRow.style.background = 'yellow';
         }
         RightDivNameLable = document.getElementById('RightDivNameLable');
         RightDivNumberLable = document.getElementById('RightDivRollNumberLable');
         RightDivGenderLable = document.getElementById('RightDivGenderLable');
         RightDivIndianLable = document.getElementById('RightDivIndianLable');
         RightDivAddressLable = document.getElementById('RightDivAddressLable');
         RightDivNameLable.innerHTML = dataModel.students[index].name;
         RightDivRollNumberLable.innerHTML = dataModel.students[index].rollNumber;
         RightDivGenderLable.innerHTML = dataModel.students[index].gender;
         RightDivIndianLable.innerHTML = dataModel.students[index].indian;
         RightDivAddressLable.innerHTML = dataModel.students[index].address;
      }

      function editSectionHandler(index, vtd) {
         return function () {
            editRow(index, vtd);
         };
      }
      function deleteSectionHandler(index, vtd) {
         return function () {
            deleteRow(index, vtd);
         };
      }

      function editRow(index, table_row) {
         var middleDiv = document.getElementById('middle_div');
         var rightDiv = document.getElementById("right_div");
         var editDiv = document.getElementById("edit_div");
         middleDiv.style.display = "none";
         rightDiv.style.display = "none";
         editDiv.style.display = "block";
         var editDivRollNumberLable = document.getElementById('EditDivRollNumberLable');
         editDivRollNumberLable.value = dataModel.students[index].rollNumber;
         var editDivNameLable = document.getElementById('EditDivNameLable');
         editDivNameLable.value = dataModel.students[index].name;
         if (dataModel.students[index].gender == 'Male')
            document.getElementById('EditDivGenderMaleLable').checked = true;
         else document.getElementById('EditDivGenderFemaleLable').checked = true;
         var editDivIndianLable = document.getElementById('EditDivIndianLable');
         if (dataModel.students[index].indian == 'Yes')
            editDivIndianLable.checked = true;
         else editDivIndianLable.checked = false;
         var editDivAddressLable = document.getElementById('EditDivAddressLable');
         editDivAddressLable.value = dataModel.students[index].address;
      }

      function addStudent() {
         var middleDiv = document.getElementById("middle_div");
         var rightDiv = document.getElementById("right_div");
         var addDiv = document.getElementById("add_div");
         middleDiv.style.display = "none";
         rightDiv.style.display = "none";
         addDiv.style.display = "block";
      }

      function deleteRow(index, table_row) {
         var middleDiv = document.getElementById("middle_div");
         var rightDiv = document.getElementById("right_div");
         var deleteDiv = document.getElementById("delete_div");
         middleDiv.style.display = "none";
         rightDiv.style.display = "none";
         deleteDiv.style.display = "block";
         var deleteDivRollNumberLable = document.getElementById('DeleteDivRollNumberLable')
         deleteDivRollNumberLable.value = dataModel.students[index].rollNumber;
         var deleteDivNameLable = document.getElementById('DeleteDivNameLable');
         deleteDivGenderLable = document.getElementById('DeleteDivGenderLable');
         deleteDivIndianLable = document.getElementById('DeleteDivIndianLable');
         deleteDivAddressLable = document.getElementById('DeleteDivAddressLable');
         deleteDivCityLable = document.getElementById('DeleteDivCityLable');
         deleteDivNameLable.value = dataModel.students[index].name;
         deleteDivGenderLable.innerHTML = dataModel.students[index].gender;
         deleteDivIndianLable.innerHTML = dataModel.students[index].indian;
         deleteDivAddressLable.innerHTML = dataModel.students[index].address;
         deleteDivCityLable.innerHTML = dataModel.students[index].city.name;
      }
   </script>