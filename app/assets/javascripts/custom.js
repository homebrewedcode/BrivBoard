/**
 * Created by dale on 07/04/17.
 */
/*********Effects for closing messages**************/
$(function(){
    $('.clickable').on('click',function(){
        var effect = $(this).data('effect');
        $(this).closest('.panel')[effect]();
    })
})