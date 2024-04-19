from django.db import models
# Create your models here.
class login_table(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    type=models.CharField(max_length=100)

class advocate_table(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    firstname=models.CharField(max_length=50)
    lastname=models.CharField(max_length=50)
    gender=models.CharField(max_length=50)
    address=models.CharField(max_length=100)
    place = models.CharField(max_length=100)
    post = models.CharField(max_length=100)
    pincode = models.IntegerField()
    email=models.CharField(max_length=50)
    phone=models.BigIntegerField()
    experience=models.CharField(max_length=20)
    qualification=models.CharField(max_length=100)
    department=models.CharField(max_length=20)
    status=models.CharField(max_length=40)
    proof=models.FileField()

class dataset_table(models.Model):
    question=models.CharField(max_length=2000)
    answer=models.CharField(max_length=2000)

class section_table(models.Model):
    case_type=models.CharField(max_length=1000)
    sections=models.CharField(max_length=30)
    details=models.CharField(max_length=10000)

class case_dataset_table(models.Model):
    SECTION=models.ForeignKey(section_table,on_delete=models.CASCADE)
    dataset=models.CharField(max_length=1000)

class section_question_table(models.Model):
    SECTION = models.ForeignKey(section_table, on_delete=models.CASCADE)
    question=models.CharField(max_length=1000)
    answer=models.CharField(max_length=1000)
    section=models.CharField(max_length=100)
    punishment=models.CharField(max_length=1000)

class user_table(models.Model):
    firstname=models.CharField(max_length=50)
    lastname=models.CharField(max_length=50)
    age=models.IntegerField()
    gender=models.CharField(max_length=10)
    address=models.CharField(max_length=100)
    place = models.CharField(max_length=100)
    post = models.CharField(max_length=100)
    pincode = models.IntegerField()
    phone=models.BigIntegerField()
    email=models.CharField(max_length=20)
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    image=models.FileField()

class complaint_table(models.Model):
     USER= models.ForeignKey(user_table, on_delete=models.CASCADE)
     complaint=models.CharField(max_length=1000)
     date=models.DateField()
     reply=models.CharField(max_length=2000)

class feedback_table(models.Model):
    USERID=models.ForeignKey(user_table, on_delete=models.CASCADE)
    ADVOCATE = models.ForeignKey(advocate_table, on_delete=models.CASCADE)
    feedback=models.CharField(max_length=1000)
    rating=models.FloatField()
    date=models.DateField()

class booking_table(models.Model):
    USER = models.ForeignKey(user_table, on_delete=models.CASCADE)
    ADVOCATE = models.ForeignKey(advocate_table, on_delete=models.CASCADE)
    date=models.DateField()
    time=models.TimeField()
    case_details=models.CharField(max_length=500)
    status=models.CharField(max_length=100)

class chat(models.Model):
    FROM_ID=models.ForeignKey(login_table,on_delete=models.CASCADE,related_name="fid")
    TO_ID=models.ForeignKey(login_table,on_delete=models.CASCADE,related_name="tid")
    message=models.CharField(max_length=2000)
    time=models.TimeField()
    date=models.DateField()

class payment(models.Model):
    USER = models.ForeignKey(user_table, on_delete=models.CASCADE)
    amount=models.FloatField()
    ADVOCATE = models.ForeignKey(advocate_table, on_delete=models.CASCADE)
    date=models.DateField()
    status=models.CharField(max_length=100)
    type=models.CharField(max_length=50)

class hearing_date(models.Model):
    Case =models.ForeignKey(booking_table,on_delete=models.CASCADE)
    date=models.DateField()
    time=models.TimeField()

class court_table(models.Model):
    court_name=models.CharField(max_length=300)
    place=models.CharField(max_length=300)
    phone=models.CharField(max_length=300)
    email=models.CharField(max_length=1000)

class evidence_table(models.Model):
    BOOKING=models.ForeignKey(booking_table,on_delete=models.CASCADE)
    date=models.DateField()
    evidence=models.FileField()
    details=models.CharField(max_length=100)

class notification(models.Model):
    BOOKING=models.ForeignKey(booking_table,on_delete=models.CASCADE)
    notification=models.CharField(max_length=1000)
    date=models.DateField()
    time=models.TimeField()

class prediction(models.Model):
    user=models.ForeignKey(user_table,on_delete=models.CASCADE)
    date=models.DateField()
    ans=models.CharField(max_length=500)
    qid=models.ForeignKey(section_question_table,on_delete=models.CASCADE)

