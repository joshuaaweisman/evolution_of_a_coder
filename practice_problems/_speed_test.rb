def test_speed(&prc)
    start = Time.now
    prc.call
    Time.now - start
end