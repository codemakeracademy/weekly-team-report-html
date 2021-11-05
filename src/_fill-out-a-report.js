
    const jquery = document.createElement('script');
    jquery.setAttribute('src', 'https://cdn.jsdelivr.net/jquery/latest/jquery.min.js');
    jquery.setAttribute('type', 'text/javascript');
    const momentsjs = document.createElement('script');
    momentsjs.setAttribute('src', 'https://cdn.jsdelivr.net/momentjs/latest/moment.min.js');
    momentsjs.setAttribute('type', 'text/javascript');
    const daterangepicker = document.createElement('script');
    daterangepicker.setAttribute('src', 'https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js');
    daterangepicker.setAttribute('type', 'text/javascript');
    const daterangepickerCSS = document.createElement('link');
    daterangepickerCSS.setAttribute('href', 'https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css');
    daterangepickerCSS.setAttribute('rel', 'stylesheet');
    daterangepickerCSS.setAttribute('type', 'text/css');
    document.head.appendChild(jquery);
    document.head.appendChild(momentsjs);
    document.head.appendChild(daterangepicker);
    document.head.appendChild(daterangepickerCSS);


    function forComment(id_name, comment) {
        let place = 'Would you like to add any comments about why you rated your morale this way? *Optional';
        if (document.getElementById(id_name) == null) {
            document.getElementById(comment).innerHTML = "<textarea rows = '6' id=" + "'" + id_name + "'" + " class='form-control z-depth-1' maxlength='250' ></textarea>";
            let element = document.getElementById(id_name);
            element.placeholder = place
            console.log(element);
        }
    }


    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    today = mm + '/' + dd + '/' + yyyy;
    $(function () {
        $('input[name="daterange"]').daterangepicker({
            opens: 'left'
        });
    });


    const moraleInputs = document.querySelectorAll('.morales input');    
    moraleInputs.forEach(el => {
        const formType = el.parentNode.parentNode.getAttribute("data-form");
        const commentType = el.parentNode.parentNode.getAttribute("data-comment");
        el.addEventListener('click', function() {forComment(formType, commentType);})
    })
