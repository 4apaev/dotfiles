((d,b,q,f,h,a=b[q]('#pageRoot article'))=>{
while (b[f])b[f].remove()
b.style.padding='1rem 5rem'
b.append(h=a[q]('header'),a[q]('[data-test=articleBody]'))
h.append(d[q]('meta[property="ob:pubDate"]').content)
})(document,document.body,'querySelector','firstChild')

