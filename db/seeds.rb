Review.create!([
  {
    first_name: 'Justin',
    last_name: 'A',
    email: 'review@example.com',
    created_at: DateTime.strptime('07/31/2016', '%m/%d/%Y'),
    approved: true,
    message: <<-END
              <p>If you are looking for the best orthopedic care in Central 
              Pennsylvania, look no further! From the receptionists to the nurses to 
              the
              Doctors all give you the same professional courtesy and care. I have had
              gel injections in my knees, and once they didn&#39;t work, they scheduled
              me for my first knee replacement. Since 2012, these people have
              unfortunately become a great part of my life, and I am fortunate they are
              there to have helped me.</p>
    END
  },
  {
    first_name: 'Carol',
    last_name: 'K',
    email: 'review@example.com',
    created_at: DateTime.strptime('07/30/2016', '%m/%d/%Y'),
    approved: true,
    message: <<-END
        <p>UOC has taken great care, from the spine team to Hand specialist, for my
        family members. Thank you all for making my family well.</p>
    END
  },
  {
    first_name: 'Tammy',
    last_name: 'L',
    email: 'review@example.com',
    created_at: DateTime.strptime('07/29/2016', '%m/%d/%Y'),
    approved: true,
    message: <<-END
        <p>My Daughter and I have had several experiences with this office with Dr.
        Ellis which has been wonderful with our surgeries, appts and spending time
            giving us complete care and not rushing. We also have had Dr. Barter who
            has been great also. This office also has a great and friendly Staff. UOC
            is a great Orthopedic Center for all our needs. Thanks UOC !!!!!</p>
    END
  },
  {
    first_name: 'Chelsea',
    last_name: 'D',
    email: 'review@example.com',
    created_at: DateTime.strptime('07/28/2016', '%m/%d/%Y'),
    approved: true,
    message: <<-END
        <p>I have never been to an office where all of the staff, from the receptionist
        to the nurses, PA&#39;s, x-ray techs, and doctors have always been friendly and
            patient! They always take their time with you, and help you with anything!
            I deal with Dr. Barter, and my father has seen Dr. Ellis. Both are
            incredible! I had surgery for the second time in the UOC Surgery Center,
              and the staff there is just as amazing!</p>
    END
  },
  {
    first_name: 'Archie',
    last_name: 'B',
    email: 'review@example.com',
    created_at: DateTime.strptime('07/27/2016', '%m/%d/%Y'),
    approved: true,
    message: <<-END
        <p>I had rotator cuff surgery from Dr. Van Kleunen in September. I was so
        surprised in the six months under his care how I was treated. He treated me
        like a real person and he really did care. In six months I was back to
        work.</p>

        <p>I told my friends and family what a caring person and top-notch doctor he
            was. My co-worker had his rotator cuff done and he is very satisfied also.
              My wife had a hip replacement.</p>

        <p>I highly recommend Dr. Van Kleunen and his nurse, Terri, for the best care.
          I thank you for the fine care you gave me.</p>
    END
  },
  {
    first_name: 'Warren',
    last_name: 'C',
    email: 'review@example.com',
    created_at: DateTime.strptime('07/26/2016', '%m/%d/%Y'),
    approved: true,
    message: <<-END
        <p>For years, Reverend Warren Cravotta could only walk with the assistance of
        crutches and braces on both of his legs. He had gone through multiple knee
        surgeries for torn ligaments and a meniscal tear. The pain became so unbearable
        that he had to use hand controls while driving and a scooter to get around
            because his legs were so weak.</p>

        <p>He finally decided to see an orthopedic specialist, Dr. Angela Rowe at
        University Orthopedics Center (formally Blair Orthopedics). Upon examination,
            Dr. Rowe instantly questioned why he was even in his braces. She explained
            to him that through medical device advances she could provide significant
            improvement to his condition. Amazingly, he was able to leave the office
            that day wearing only a small knee brace and carrying his crutches. After a
            few months of aggressive physical therapy and a series of injections in his
            knees, he no longer had to wear any braces or use crutches. Today, Reverend
        Cravotta is pain free, able to exercise on his own, and is enjoying riding his
            bicycle again. &ldquo;I truly believe you have a group of caring physicians
            that listen and work with you. Dr. Rowe gave me back my life.&rdquo;
            </p>
    END
  },
  {
    first_name: 'Laura',
    last_name: 'M',
    email: 'review@example.com',
    created_at: DateTime.strptime('07/25/2016', '%m/%d/%Y'),
    approved: true,
    message: <<-END
      <p>Laura Maiolo and Dr. Angela Rowe&#39;s relationship began in the spring of
      2006. Laura had been having problems with her knee for quite some time. She had
      extreme difficulties walking up and down steps. Since the very first office
      visit, Dr. Rowe impressed Laura with her compassionate and caring attitude.
          &quot;She immediately greeted me with a cheerful smile and extended her
          hand while introducing herself. Dr. Rowe sincerely listened to my concerns
          and really understood my pain and frustrations.&quot;</p>

      <p>After reviewing an MRI of Laura&rsquo;s knee and discussing Laura&rsquo;s
          options, together they decided it would be best to schedule surgery. Laura
          was very nervous the day of her surgery; however, Dr. Rowe was very
          personable not only with her patient, but also with her family and their
          emotions. Laura is doing much better because of Dr. Rowe&rsquo;s help and
          motivation. &ldquo;I have had such a good experience having Dr. Rowe as my
          physician; we&rsquo;ve already begun discussing surgery for my other
          knee.&quot; &ndash; Laura M.</p>
    END
  }
])
