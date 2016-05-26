{% extends 'h5:page/layout.tpl' %}
{% block content %}
     <div id="pages-container">
        {% widget "h5:widget/message/message.tpl"%}
     </div>
     {% script%}
     	window.location.href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D%E5%BB%BA%E5%8D%8E%E8%B7%AF";    	
     {% endscript%}
{% endblock %}