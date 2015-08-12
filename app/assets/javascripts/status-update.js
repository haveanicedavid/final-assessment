$(document).ready( function(){
  bindToggleCompletion();
});

function bindToggleCompletion () {
  $(".task-status").on('click', function(data) {
    data.preventDefault();

    var current = $(this).html();
    var id      = $(this).data(id).id;
    var status  = null;

    if (current === 'Incomplete') {
      $(this).html("Complete");
      status = 1;
    } 

    if (current === "Complete") {
      $(this).html("Incomplete");
      status = 0;
    }

    $.ajax({
      type: "POST",
      url: "/update_status",
      dataType: "json",
      data: {
        "task_id": id ,
        "status": status
      }
    });
    
  });
}
