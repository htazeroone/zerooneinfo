<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
 	if(confirm("${cf}")) {
		location.href="${url}";
	} else {
		location.href="Detail?id=${param.id}&subject=${param.subject}";
	}
 	
</script>