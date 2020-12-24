window.onload = function () {
    // クリック回数をリスト化
    var tsubo = [
      {name:"nose",count:0},
      {name:"eye",count:0},
      {name:"ear",count:0},
      {name:"head",count:0},
      {name:"neck",count:0},
      {name:"thyroid",count:0}, //甲状腺
      {name:"heart",count:0},
      {name:"stomach",count:0},
      {name:"lymph",count:0}, //リンパ
      {name:"trapezis",count:0}, //僧帽筋
      {name:"lung",count:0}, //肺
      {name:"esophagus",count:0}, //食道
      {name:"trachea",count:0}, //気管
      {name:"shoulder",count:0}, //肩
      {name:"adrenal",count:0}, //副腎
      {name:"kidney",count:0}, //腎臓
      {name:"spleen",count:0}, //脾臓
      {name:"pancreas",count:0}, //膵臓
      {name:"intestines",count:0}, //腸
      {name:"ureter",count:0}, //尿管
      {name:"bladder",count:0}, //膀胱
      {name:"sacrum",count:0}, //仙骨
      {name:"genital",count:0}, //生殖器
      {name:"knee",count:0},
      {name:"waist",count:0},
      {name:"liver",count:0}, //肝臓
      {name:"gall_bladder",count:0} //胆嚢
    ];

    lists.sort( function( a, b){
      if ( a.count > b.count ) return -1;
      if ( a.count < b.count ) return 1;
      return 0;
    });


    var $pain_a = document.getElementById( "pain_a" );
    var $fukubiku = document.getElementsByClassName( "副鼻腔" );
    for( var $i = 0; $i < $fukubiku.length; $i++ ) {
        $fukubiku[$i].onclick = function () {
            $pain_a.innerHTML = parseInt( $pain_a.innerHTML ) + 1;
        }
    }
    var $pain_b = document.getElementById( "pain_b" );
    var $me = document.getElementsByClassName( "目" );
    for( var $i = 0; $i < $me.length; $i++ ) {
        $me[$i].onclick = function () {
            $pain_b.innerHTML = parseInt( $pain_b.innerHTML ) + 1;
        }
    }
}
