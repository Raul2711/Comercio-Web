// JavaScript Document<script>
$('.openBtn').on('click',function(){
    $('.modal-body').load('Registro.html',function(){
        $('#myModal').modal({show:true});
    });
});