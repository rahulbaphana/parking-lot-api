CREATE FUNCTION public.gen_gc_id(prefix text, seq_name text, random_part_length integer DEFAULT 4) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
seq_id bigint;
BEGIN
SELECT nextval(seq_name)
INTO seq_id;
return prefix || base32(seq_id, 8) || random_base32(random_part_length);
END;
    $$;