$(document).ready( function(){
  bindToggleCompletion();
  bindShowAllTasks();
  hideCompleteTasksOnLoad();
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

function bindShowAllTasks () {
  $('#show-complete-tasks').on('click', function(data) {
    data.preventDefault();
    $('.task-item').each(function() {
      $(this).show();
    });
  });
}

function hideCompleteTasksOnLoad () {
  $('.task-status').each(function() {
    if ($(this).html() === "Complete") {
      var daddy = $(this).parents('.task-item');
      daddy.toggle();
      // console.log($(this).parents('.task-item'));
    }
    // console.log($(this).html());
  });
}
