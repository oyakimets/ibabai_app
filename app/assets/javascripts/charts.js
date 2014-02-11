
	$(function () {	
		$('#promo-charts').highcharts({
			chart: {
				type: 'bar'
			},

			title: {
				text: "Promo charts"
			},

			xAxis: {
				categories: gon.chart_names
			},

			yAxis: {
				title: {

					text: 'feedback attributes'
				}
			},

			series: gon.chart_data

		});

		var names = gon.chart_names
		var data_set = gon.chart_data
		for(i=0; i<names.length; i++) {

			var name=$("<th id='t-val'></th>").text(names[i]);
			$("#table-names").append(name);		

			};
			
		for(j=0; j<data_set.length; j++) {
			var ident = 'table-data' + j.toString();
			var newrow = $("<tr id=" + ident + "/>");
			$(".table-striped").append(newrow);
				var atr_name = $("<td></td>").text(data_set[j]["name"]);
				$("#"+ident).append(atr_name);
					for(k=0; k<data_set[j]["data"].length; k++) {
						var atr_data = $("<td id='t-val'></td>").text(data_set[j]["data"][k]);
						$("#"+ident).append(atr_data);
				}
			};

	});
	
