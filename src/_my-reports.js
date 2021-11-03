try {
    const expandAll = document.querySelector('.expand-all');
    const collapses = document.querySelectorAll('.collapse');
    expandAll.addEventListener('click', function(){
        collapses.forEach(el => {
            el.classList.add('show');
        })
    })



    const btnReportsCollapses = document.querySelectorAll('.btn-reports-collapse');
    let cardHeaders = document.querySelectorAll('.card-header');
    btnReportsCollapses.forEach(el => {
        el.addEventListener('click', function(){
            if (!el.parentNode.parentNode.parentNode.classList.contains('expanded')) {
                el.parentNode.parentNode.parentNode.classList.add('expanded');
                el.parentNode.parentNode.parentNode.querySelector('.period').classList.add('selected');
                el.parentNode.querySelector('svg').classList.add('spin');
                el.classList.add('to-white');
                el.innerHTML = el.innerHTML.replace("Expand", "Collapse");
                el.parentNode.parentNode.querySelector('.smiles').classList.add('vh');
                cardHeaders = Array.from(cardHeaders);
                const expandedCardHeader = cardHeaders.filter(ch => (ch.classList.contains('expanded') && ch != el.parentNode.parentNode.parentNode))[0];
                if (expandedCardHeader) {
                    expandedCardHeader.classList.remove('expanded');
                    expandedCardHeader.querySelector('.period').classList.remove('selected');
                    expandedCardHeader.querySelector('svg').classList.remove('spin');
                    expandedCardHeader.querySelector('.smiles').classList.remove('vh');
                    expandedCardHeader.querySelector('.to-white').innerHTML = expandedCardHeader.querySelector('.to-white').innerHTML.replace("Collapse", "Expand");
                    expandedCardHeader.querySelector('.to-white').classList.remove('to-white');
                }
            } else {
                el.parentNode.parentNode.parentNode.classList.remove('expanded');
                el.parentNode.parentNode.parentNode.querySelector('.period').classList.remove('selected');
                el.parentNode.parentNode.querySelector('.smiles').classList.remove('vh');
                el.parentNode.querySelector('svg').classList.remove('spin');
                el.classList.remove('to-white');
                el.innerHTML = el.innerHTML.replace("Collapse", "Expand");
            }
        })
    })
} catch {}