import json
from datetime import datetime
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
import math
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize
from Law.rec import recommendor
ps = PorterStemmer()
# Create your views here.
from Law.models import *
from collections import Counter
import  re
def main(request):
    return render(request,"loginindex.html")

def logincode(request):
    try:
        un=request.POST['textfield']
        ps=request.POST['a']
        print(un,ps)
        ob=login_table.objects.get(username=un,password=ps)
        print(ob)
        if ob is None:
            return HttpResponse('''<script>alert("invalid username or password");window.location='/'</script>''')
        elif ob.type=="admin":
            print("h")
            ob1=auth.authenticate(username="00000",password="admin")
            print(ob1)
            if ob1 is not None:
                auth.login(request,ob1)
            return redirect('/admin_home')
        elif ob.type=="advocate":
            request.session['lid']=ob.id
            ob1 = auth.authenticate(username="00000", password="admin")
            if ob1 is not None:
                auth.login(request,ob1)
            return redirect('/Advocate_Home')
        else:
            return HttpResponse('''<script>alert("invalid user");window.location='/'</script>''')
    except:
        return HttpResponse('''<script>alert("invalid user");window.location='/'</script>''')

def logout(request):
    auth.logout(request)
    return render(request,"loginindex.html")

def advocatecode(request):
    try:
        print(request.POST)
        fn=request.POST['textfield']
        ln=request.POST['textfield2']
        gn=request.POST['radiobutton']
        ad=request.POST['textarea']
        ph=request.POST['textfield6']
        em=request.POST['textfield7']
        qu=request.POST['textfield8']
        de=request.POST['textfield9']
        un=request.POST['textfield10']
        ps=request.POST['textfield11']
        place=request.POST['textfield12']
        post=request.POST['textfield13']
        pin=request.POST['textfield14']
        exp=request.POST['textfield15']
        st=request.POST['textfield16']
        proof=request.FILES['file']
        fs=FileSystemStorage()
        fsave=fs.save(proof.name,proof)
        ob1=login_table()
        ob1.username=un
        ob1.password=ps
        ob1.type="pending"
        ob1.save()
        ob=advocate_table()
        ob.firstname=fn
        ob.lastname=ln
        ob.gender=gn
        ob.address=ad
        ob.place=place
        ob.post=post
        ob.pincode=pin
        ob.email=em
        ob.phone=ph
        ob.status=st
        ob.proof=fsave
        ob.qualification=qu
        ob.department=de
        ob.experience=exp
        ob.LOGIN=ob1
        ob.save()
    except Exception as e:
        print(e,"=============================")
    return HttpResponse('''<script>alert("successfully register");window.location='/'</script>''')
@login_required(login_url='/')
def section_question(request):
    ob=section_table.objects.all()
    return render(request,"admin/add section question.html",{'val':ob})
@login_required(login_url='/')
def add_sctnqstns(request):
    print(request.POST,"000000000000000")
    qstn = request.POST['textarea']
    ans = request.POST['textarea2']
    sctn = request.POST['select']
    sct = request.POST['textarea5']
    pnmnt = request.POST['textarea4']
    ob = section_question_table()
    ob.question = qstn
    ob.answer = ans
    ob.SECTION = section_table.objects.get(id=sctn)
    ob.section = sct
    ob.punishment = pnmnt
    ob.save()
    return HttpResponse('''<script>alert("successfully Added");window.location='/manage_case_section_question'</script>''')

@login_required(login_url='/')
def case_dataset(request):
    ob = section_table.objects.all()
    return render(request,"admin/case_dataset.html",{'val':ob})
@login_required(login_url='/')
def questioncode(request):
    se= request.POST['select']
    da=request.POST['textfield']
    ob = case_dataset_table()
    ob.SECTION=section_table.objects.get(id=se)
    ob.dataset=da
    ob.save()
    return HttpResponse('''<script>alert("successfully Added");window.location='/admin_home'</script>''')

@login_required(login_url='/')
def manage_case_section_question(request):
    ob = section_question_table.objects.all()
    return render(request,"admin/manage case section question.html",{'val':ob})

@login_required(login_url='/')
def dele(request,id):
    ob=section_question_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("Deleted");window.location='/manage_case_section_question'</script>''')



def admin_home(request):
    return render(request,"adminindex.html")

@login_required(login_url='/')
def approve_advocate(request):
    ob=advocate_table.objects.all()
    return render(request,"admin/approve adv (1).html",{'val':ob})


@login_required(login_url='/')
def searchapprove_advocate(request):
    name=request.POST['textfield']
    ob=advocate_table.objects.filter(firstname__icontains=name)
    return render(request,"admin/approve adv (1).html",{'val':ob})

@login_required(login_url='/')
def acceptad(request,id):
    ob=login_table.objects.get(id=id)
    ob.type="advocate"
    ob.save()
    return HttpResponse('''<script>alert("Accepted");window.location='/approve_advocate'</script>''')

@login_required(login_url='/')
def rejectad(request,id):
    ob=login_table.objects.get(id=id)
    ob.type="rejected"
    ob.save()
    return HttpResponse('''<script>alert("Rejected ");window.location='/approve_advocate'</script>''')


@login_required(login_url='/')
def manage_court_details(request):
    ob=court_table.objects.all()
    return render(request,"admin/manage court details.html",{'val':ob})

@login_required(login_url='/')
def delete(request,id):
    ob=court_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("Deleted");window.location='/manage_court_details'</script>''')


@login_required(login_url='/')
def edit_court(request,id):
    ob = court_table.objects.get(id=id)
    request.session['cid']=id
    return render(request,"admin/edit court.html",{'val':ob})


@login_required(login_url='/')
def editcode(request):
    cna=request.POST['name']
    pla=request.POST['Place']
    phon=request.POST['Phone']
    emai=request.POST['Email']

    ob=court_table.objects.get(id=request.session['cid'])
    ob.court_name=cna
    ob.place=pla
    ob.phone=phon
    ob.email=emai
    ob.save()

    return HttpResponse('''<script>alert("Edited");window.location='/manage_court_details'</script>''')


@login_required(login_url='/')
def courtcode(request):
    cn=request.POST['name']
    pla=request.POST['Place']
    pho=request.POST['Phone']
    ema=request.POST['Email']

    ob=court_table()
    ob.court_name=cn
    ob.place=pla
    ob.phone=pho
    ob.email=ema
    ob.save()

    return HttpResponse('''<script>alert("Successfully added");window.location='/manage_court_details'</script>''')

@login_required(login_url='/')
def add_new_court(request):
    return render(request,"admin/add new court.html")

@login_required(login_url='/')
def manage_dataset(request):
    ob = dataset_table.objects.all()
    return render(request,"admin/manage dataset.html",{'val':ob})


@login_required(login_url='/')
def dlt_ds(request,id):
    ob=dataset_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("Deleted");window.location='/manage_dataset'</script>''')

@login_required(login_url='/')
def datasetcode(request):
    qn=request.POST['question']
    an=request.POST['answer']

    ob=dataset_table()
    ob.question=qn
    ob.answer=an
    ob.save()
    return HttpResponse('''<script>alert("Successfully added");window.location='/manage_dataset'</script>''')





@login_required(login_url='/')
def add_dataset(request):
    return render(request,"admin/add dataset.html")

@login_required(login_url='/')
def manage_section(request):
    ob = section_table.objects.all()
    return render(request,"admin/manage section.html",{'val':ob})

@login_required(login_url='/')
def sectioncode(request):
    ct= request.POST['case']
    se=request.POST['section']
    dt=request.POST['details']

    ob=section_table()
    ob.case_type=ct
    ob.sections=se
    ob.details=dt
    ob.save()

    return HttpResponse('''<script>alert("Successfully added");window.location='/manage_section'</script>''')

@login_required(login_url='/')
def delet(request,id):
    ob=section_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("Deleted");window.location='/manage_section'</script>''')


@login_required(login_url='/')
def add_new_section(request):
    return render(request,"admin/add new section.html")

@login_required(login_url='/')
def view_complaint(request):
    ob=complaint_table.objects.all()
    return render(request,"admin/view complaint.html",{'val':ob})


@login_required(login_url='/')
def reply(request,id):
    request.session['cid']=id
    return render(request,"admin/reply.html")

@login_required(login_url='/')
def reply_code(request):
    rep=request.POST['reply']
    ob=complaint_table.objects.get(id=request.session['cid'])
    ob.reply=rep
    ob.save()
    return HttpResponse('''<script>alert("Replied");window.location='/view_complaint'</script>''')



@login_required(login_url='/')
def feedback(request):
    ob = feedback_table.objects.all()
    return render(request,"admin/feedback.html",{'val':ob})

@login_required(login_url='/')
def Block_advocate(request):
    ob = advocate_table.objects.all()
    return render(request,"admin/Block adv.html",{'val':ob})


@login_required(login_url='/')
def Search_Block_advocate(request):
    name=request.POST['textfield']
    ob=advocate_table.objects.filter(firstname__icontains=name)
    return render(request,"admin/Block adv.html",{'val':ob})

@login_required(login_url='/')
def blocked(request,id):
    ob=login_table.objects.get(id=id)
    ob.type="block"
    ob.save()
    return HttpResponse('''<script>alert("Blocked");window.location='/Block_advocate'</script>''')


@login_required(login_url='/')
def unblocked(request,id):
    ob=login_table.objects.get(id=id)
    ob.type="advocate"
    ob.save()
    return HttpResponse('''<script>alert("Unblocked");window.location='/Block_advocate'</script>''')



def Advocate_Registration(request):
    return render(request,"regindex.html")





@login_required(login_url='/')

def Advocate_Home(request):
    return render(request,"adv/advocate_index.html")

@login_required(login_url='/')
def View_booking(request):
    ob=booking_table.objects.filter(ADVOCATE__LOGIN__id=request.session['lid'])
    return render(request,"adv/view booking.html",{'val':ob})


@login_required(login_url='/')
def acceptbooking(request,id):
    ob=booking_table.objects.get(id=id)
    ob.status="accept"
    ob.save()
    return HttpResponse('''<script>alert("Accepted");window.location='/View_booking'</script>''')


@login_required(login_url='/')
def rejectbooking(request,id):
    ob=booking_table.objects.get(id=id)
    ob.status="reject"
    ob.save()
    return HttpResponse('''<script>alert("Rejected");window.location='/View_booking'</script>''')


@login_required(login_url='/')
def Add_hearing_dates(request,id):
    # ob=hearing_date.objects.get(id=id)
    request.session['cid']=id

    return render(request,"adv/Add hearing dates.html")

def hearing_details(request):
    da=request.POST['textfield2']
    tm=request.POST['textfield3']
    ob=hearing_date()
    ob.Case=booking_table.objects.get(id= request.session['cid'])
    ob.date=da
    ob.time=tm
    ob.save()
    obb=booking_table.objects.get(id=request.session['cid'])
    obb.status='given'
    obb.save()
    return HttpResponse('''<script>alert("Added");window.location='/Manage_hearing_dates'</script>''')

@login_required(login_url='/')
def Manage_hearing_dates(request):
    ob=hearing_date.objects.all()
    return render(request,"adv/manage hearing dates.html",{'val':ob})


@login_required(login_url='/')
def hearingcode(request):
    ca=request.POST['textfield']
    dt=request.POST['textfield2']
    ti=request.POST['textfield3']

    ob=hearing_date()
    ob.case_id=ca
    ob.date=dt
    ob.time=ti
    ob.save()

    return HttpResponse('''<script>alert("Added");window.location='/Manage_hearing_dates'</script>''')






@login_required(login_url='/')
def View_payment_history(request):
    ob=payment.objects.all()
    return render(request,"adv/view payment history.html",{'val':ob})


@login_required(login_url='/')
def chatwithuser(request):
    ob = user_table.objects.all()
    return render(request,"adv/fur_chat.html",{'val':ob})

@login_required(login_url='/')
def chatview(request):
    ob = user_table.objects.all()
    d=[]
    for i in ob:
        r={"name":i.firstname,'photo':i.image.url,'email':i.email,'loginid':i.LOGIN.id}
        d.append(r)
    return JsonResponse(d, safe=False)

@login_required(login_url='/')
def coun_msg(request,id):
    ob1=chat.objects.filter(FROM_ID__id=id,TO_ID__id=request.session['lid'])
    ob2=chat.objects.filter(FROM_ID__id=request.session['lid'],TO_ID__id=id)
    combined_chat = ob1.union(ob2)
    combined_chat=combined_chat.order_by('id')
    res=[]
    for i in combined_chat:
        res.append({"from_id":i.FROM_ID.id,"msg":i.message,"date":i.date,"chat_id":i.id})
    obu=user_table.objects.get(LOGIN__id=id)
    return JsonResponse({"data":res,"name":obu.firstname,"photo":obu.image.url,"user_lid":obu.LOGIN.id})


@login_required(login_url='/')
def coun_insert_chat(request,msg,id):
    print("===",msg,id)
    ob=chat()
    ob.FROM_ID=login_table.objects.get(id=request.session['lid'])
    ob.TO_ID=login_table.objects.get(id=id)
    ob.message=msg
    ob.date=datetime.now().strftime("%Y-%m-%d")
    ob.time=datetime.now()
    ob.save()
    return JsonResponse({"task":"ok"})
    # refresh messages chatlist
@login_required(login_url='/')

def ManageEvidence(request,id):
    request.session['eid'] = id
    ob = evidence_table.objects.filter(BOOKING__id=id)
    return render(request, "adv/Manage Evidence.html",{'val':ob})
@login_required(login_url='/')
def ManageNotification(request,id):
    request.session['nid']=id
    ob=notification.objects.filter(BOOKING__id=id)
    return render(request, "adv/Manage Notification.html",{'val':ob})
@login_required(login_url='/')
def Notification(request):
    return render(request, "adv/Notification.html")
@login_required(login_url='/')
def eviden(request):
    return render(request, "adv/evid.html")
@login_required(login_url='/')
def addnotif(request):
    noti=request.POST['textarea']
    ob=notification()
    ob.notification=noti
    ob.date=datetime.today()
    ob.time=datetime.today()
    ob.BOOKING=booking_table.objects.get(id=request.session['nid'])
    ob.save()
    return HttpResponse('''<script>alert("send");window.location='/View_booking'</script>''')
@login_required(login_url='/')
def addevid(request):
    det=request.POST['textarea']
    evid=request.FILES['file']
    fn=FileSystemStorage()
    fs=fn.save(evid.name,evid)
    ob=evidence_table()
    ob.evidence=fs
    ob.date=datetime.today()
    ob.details=det
    ob.BOOKING=booking_table.objects.get(id=request.session['eid'])
    ob.save()
    return HttpResponse('''<script>alert("Added..");window.location='/View_booking'</script>''')

# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% web-service%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
def logincodess(request):
    print(request.POST)
    un = request.POST['uname']
    pwd = request.POST['pass']
    print(un, pwd)
    try:
        users = login_table.objects.get(username=un, password=pwd)
        if users is None:
            data = {"task": "invalid"}
        else:
            print("in user function")
            data = {"task": "valid", "id": users.id}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)
    except:
        data = {"task": "invalid"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)




def registration(request):
    Fname=request.POST['Fname']
    Lname=request.POST['Lname']
    add = request.POST['address']
    place= request.POST['place']
    post_office = request.POST['post']
    pin_code = request.POST['pin_code']
    phone = request.POST['phone_number']
    gender = request.POST['gender']
    email_id = request.POST['emil_id']
    uname = request.POST['username']
    passwd = request.POST['password']
    image =request.FILES['file']
    fs=FileSystemStorage()
    fsave=fs.save(image.name,image)
    age =request.POST['age']

    lob = login_table()
    lob.username = uname
    lob.password = passwd
    lob.type = 'user'
    lob.save()

    userob = user_table()
    userob.firstname = Fname
    userob.lastname = Lname
    userob.address = add
    userob.place = place
    userob.post = post_office
    userob.pincode = pin_code
    userob.phone = phone
    userob.gender = gender
    userob.age = age
    userob.email = email_id
    userob.image=fsave

    userob.LOGIN=lob
    userob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)


def sendfeedback(request):
    print(request.POST,"jjjjjjjjjjjjjjjjjjjjjjjjjjjj")
    lidd=request.POST['lid']
    feedbacks=request.POST['feedback']
    ra=request.POST['rating']
    aid=request.POST['aid']
    feed=feedback_table()
    date = datetime.today()
    feed.feedback=feedbacks
    feed.rating=ra
    feed.date=date
    feed.USERID=user_table.objects.get(LOGIN__id=lidd)
    feed.ADVOCATE=advocate_table.objects.get(id=aid)
    feed.save()
    data = {"task": "valid"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)

def complaint_user(request):
    lidd=request.POST['USER']
    comp=request.POST['complaint']
    date = datetime.today()
    complaint=complaint_table()
    complaint.complaint=comp
    complaint.reply='pending'
    complaint.date=date
    complaint.USER=user_table.objects.get(LOGIN__id=lidd)
    complaint.save()
    data = {"task": "valid"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)

def view_reply_comp(request):
    lid=request.POST['lid']
    ob=complaint_table.objects.filter(USER__LOGIN__id=lid)
    data = []
    for i in ob:
        row = {"complaint":i.complaint, "date":str(i.date), "reply":i.reply}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)


def view_feedback(request):
    lid=request.POST['lid']
    ob=feedback_table.objects.filter(USER__LOGIN__id=lid)
    data = []
    for i in ob:
        row = {"feedback":i.feedback, "date":str(i.date),"rating":i.rating}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

WORD = re.compile(r'\w+')


def text_to_vector(text):
    words = WORD.findall(text)
    return Counter(words)

def get_cosine(vec1, vec2):
    intersection = set(vec1.keys()) & set(vec2.keys())
    numerator = sum([vec1[x] * vec2[x] for x in intersection])
    sum1 = sum([vec1[x] ** 2 for x in vec1.keys()])
    sum2 = sum([vec2[x] ** 2 for x in vec2.keys()])
    denominator = math.sqrt(sum1) * math.sqrt(sum2)

    if not denominator:
        return 0.0
    else:
        return float(numerator) / denominator

def sr(txt):
     stop_words = set(stopwords.words('english'))
     word_tokens = word_tokenize(txt)
     filtered_sentence = [w for w in word_tokens if not w.lower() in stop_words]
     stemlist=[]
     for i in filtered_sentence:
         stemlist.append(ps.stem(i))
     return ' '.join(stemlist)

def view_section_info(request):
    case_details=request.POST['casetype'].lower()
    textdata=sr(case_details)
    v1=text_to_vector(textdata)
    ob=section_table.objects.all()
    sid=0
    max_sim=0
    for i in ob:
        det=''
        obd=case_dataset_table.objects.filter(SECTION__id=i.id)
        for j in obd:
            det=det+" "+j.dataset.lower()
        textdata=sr(det)
        v2=text_to_vector(textdata)
        sim=get_cosine(v1,v2)
        if sim>max_sim:
            max_sim=sim
            sid=i.id
    print(sid,"===============")
    print(sid,"===============")
    print(sid,"===============")
    print(sid,"===============")
    print(sid,"===============")
    ob=section_table.objects.filter(id=sid)
    data=[]
    for i in ob:
        row = {"case_type":i.case_type, "sections":i.sections, "details":i.details,"sid":i.id}
        data.append(row)
    return JsonResponse(data,safe=False)

def advstatus(request):
    return render(request,"adv/status.html")

def advstatuscode(request):
    status=request.POST['textfield']
    ob=advocate_table.objects.get(LOGIN__id=request.session['lid'])
    ob.status=status
    ob.save()
    return HttpResponse('''<script>alert("Updated");window.location='/advstatus'</script>''')




def view_advocate_info(request):

    ob=advocate_table.objects.filter(LOGIN__type='advocate')
    data = []
    for i in ob:
        row = {"aid":i.id,"lid":i.LOGIN.id,"fname":i.firstname,"lname":i.lastname, "address":i.address,"place":i.place,"post":i.post,"pin":str(i.pincode),"phone":i.phone,"email":i.email,"qualification":i.qualification,"department":i.department,"gender":i.gender,"experience":i.experience,"status":i.status}
        print(row,"**********************************")
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def view_advocate_infoo(request):
    d=request.POST['d']
    ob=advocate_table.objects.filter(department__icontains=d)
    data = []
    for i in ob:
        row = {"aid":i.id,"fname":i.firstname,"lname":i.lastname, "address":i.address,"place":i.place,"post":i.post,"pin":str(i.pincode),"phone":i.phone,"email":i.email,"qualification":i.qualification,"department":i.department,"gender":i.gender,"experience":i.experience,"status":i.status}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def get_question(request):
    sid=request.POST['sid']
    ob=section_question_table.objects.filter(SECTION__id=sid)
    data = []
    for i in ob:
        row = {"question": i.question, "qid": i.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)
def court_details(request):
    ob=court_table.objects.all()
    data = []
    for i in ob:
        row = {"court name":i.court_name,"place":i.place,"phone":i.phone,"email":i.email}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def court_details2(request):
    p=request.POST['p']
    ob=court_table.objects.filter(place__icontains=p)
    data = []
    for i in ob:
        row = {"court name":i.court_name,"place":i.place,"phone":i.phone,"email":i.email}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def booking_advocate(request):
    lidd=request.POST['lid']
    print(lidd,"==================")
    aid=request.POST['aid']
    book=booking_table()
    date = datetime.today()
    case_details= request.POST['casedetails']
    book.status='pending'
    book.date=date
    book.case_details=case_details
    book.USER=user_table.objects.get(LOGIN__id=lidd)
    book.ADVOCATE=advocate_table.objects.get(id=aid)
    book.time=datetime.now()
    book.save()
    data = {"task": "valid"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)

def sectioninfoo(request):
    ob = section_question_table.objects.all()
    data = []
    for i in ob:
        row = {"question":i.question, "sections":i.section, "punishment":i.punishment}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def psections(request):
    lid=request.POST['lid']
    ob = prediction.objects.filter(user__LOGIN__id=lid)
    lis=[]
    for k in ob:
        obb=section_question_table.objects.get(id=k.qid.id)
        if obb.answer==k.ans:
            res=section_question_table.objects.filter(id=obb.id)
            for i in res:
                row = {"case_type": i.SECTION.case_type, "sections": i.section, "details": i.punishment}
                lis.append(row)
    r = json.dumps(lis)
    return HttpResponse(r)


def search_section(request):
    ob = section_table.objects.all()
    data = []
    for i in ob:
        row = {"case_type": i.case_type, "sections": i.sections, "details": i.details}
        data.append(row)
    r = json.dumps(data)
    print(r,"-------------------")
    return HttpResponse(r)



def search_section1(request):
    s=request.POST['s']
    ob = section_table.objects.filter(sections__icontains=s)
    data = []
    for i in ob:
        row = {"case_type": i.case_type, "sections": i.sections, "details": i.details}
        data.append(row)
    r = json.dumps(data)
    print(r,"-------------------")
    return HttpResponse(r)

def notificationn(request):
    lidd = request.POST['lid']
    ob = notification.objects.filter(BOOKING__USER__LOGIN__id=lidd)
    data = []
    for i in ob:
        row = {"notification":i.notification,"date":str(i.date),"time":str(i.time)}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)
def view_advocate_recom(request):
    lid= request.POST['lid']
    from django.db import connection
    cursor = connection.cursor()
    res1 = recommendor(lid)
    ob = user_table.objects.get(LOGIN__id=lid)
    print(ob.id, "=====")
    res=[]
    cursor.execute(
        "SELECT * FROM `law_advocate_table` WHERE `id` IN(SELECT `ADVOCATE_id` FROM `law_feedback_table` WHERE `ADVOCATE_id` IN(" + res1 + ") ) AND `id` NOT IN(SELECT `ADVOCATE_id` FROM `law_feedback_table` WHERE `USERID_id`='" + str(
            ob.id) + "')")
    s = cursor.fetchall()
    for ii in s:
        res.append(ii[0])
    ob = advocate_table.objects.filter(LOGIN__type='advocate',id__in=res)
    data = []
    for i in ob:
        row = {"aid": i.id, "lid": i.LOGIN.id, "fname": i.firstname, "lname": i.lastname, "address": i.address,
               "place": i.place, "post": i.post, "pin": str(i.pincode), "phone": i.phone, "email": i.email,
               "qualification": i.qualification, "department": i.department, "gender": i.gender,
               "experience": i.experience, "status": i.status}
        print(row, "**********************************")
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)



def evidencee(request):
    lidd = request.POST['lid']
    ob = evidence_table.objects.filter(BOOKING__USER__LOGIN__id=lidd)
    data = []
    for i in ob:
        row = {"evid":str(i.evidence),"date":str(i.date),"det":str(i.details)}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)
def bstatus(request):
    lidd = request.POST['lid']
    ob = booking_table.objects.filter(USER__LOGIN__id=lidd)
    data = []
    for i in ob:
        row = {"name": str(i.ADVOCATE.firstname)+" "+i.ADVOCATE.lastname, "date": str(i.date), "time": str(i.time),'status':i.status}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)
def chat_(request):
    ob = advocate_table.objects.all()
    print(ob,"HHHHHHHHHHHHHHH")
    mdata = []
    for i in ob:
        data = {'name': i.firstname+" "+i.lastname, 'id': i.LOGIN.id}
        mdata.append(data)

    r = json.dumps(mdata)
    return HttpResponse(r)


def in_message2(request):
    print(request.POST)
    fromid = request.POST['fid']
    print("fromid",fromid)
    toid = request.POST['toid']
    print("toid",toid)
    message=request.POST['msg']
    ob=chat()
    ob.FROM_ID=login_table.objects.get(id=fromid)
    ob.TO_ID=login_table.objects.get(id=toid)
    ob.message=message
    ob.date=datetime.today()
    ob.time=datetime.now()
    ob.save()
    data = {"status": "send"}
    r = json.dumps(data)
    return HttpResponse(r)

#     # qry = "INSERT INTO `chat` VALUES(NULL,%s,%s,%s,CURDATE())"
#     # value = (fromid, toid, message)
#     # print("pppppppppppppppppp")
#     # print(value)
#     # iud(qry, value)
#     # return jsonify(status='send')

def view_message2(request):
    print(request.POST)
    fromid=request.POST['fid']
    toid=request.POST['toid']
    mid=request.POST['lastmsgid']
    print(mid,"jjjjjjjjjjj")
    ob1=chat.objects.filter(FROM_ID__id=fromid,TO_ID__id=toid,id__gt=mid)
    ob2=chat.objects.filter(FROM_ID__id=toid,TO_ID__id=fromid,id__gt=mid)
    ob=ob1.union(ob2)
    print(ob1)
    ob=ob.order_by("id")
    data=[]
    for i in ob:
        r={"msgid":i.id,"date":str(i.date),"message":i.message,"fromid":i.FROM_ID.id}
        data.append(r)
    if len(data)>0:
        return JsonResponse({"status":"ok","res1":data})
    else:
        return JsonResponse({"status":"no"})

def paymentfinish(request):
    oid=request.POST['bid']
    amount=request.POST['amt']
    lid=request.POST['lid']
    ob = payment()
    ob.USER=user_table.objects.get(LOGIN__id=lid)
    ob.ADVOCATE=advocate_table.objects.get(id=oid)
    ob.status='PAID'
    ob.amount=amount
    ob.type='online'
    ob.date=datetime.now()
    ob.save()
    data = {"task":"success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)

def answertest(request):
    qid=request.POST['qid']
    ans=request.POST['ans']
    lid=request.POST['lid']
    ob = prediction()
    ob.user=user_table.objects.get(LOGIN__id=lid)
    ob.qid=section_question_table.objects.get(id=qid)
    ob.ans=ans
    ob.date=datetime.now()
    ob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)
